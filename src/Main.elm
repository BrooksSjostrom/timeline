module Main exposing (..)

import Browser
import Dict
import Element exposing (Element, layout, html, el, padding, spacing, width, row, column, text, paragraph)
import Element.Input as Input
import Element.Background as Background
import Element.Font as Font
import Element.Border as Border
import EventList exposing (..)
import Html exposing (Html, br, button, div, input, span)
import Html.Attributes exposing (checked, placeholder, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Random
import Random.List
import Types exposing (..)
import Util exposing (..)
import Styles exposing (..)


init : ( Model, Cmd Msg )
init =
    ( Setup (SetupModel [] 7 False), Cmd.none )


main : Program () Model Msg
main =
    Browser.document
        { init = \flags -> init
        , view = view
        , update = update
        , subscriptions = subs
        }


deckGen : Int -> List Event -> Random.Generator (List Event)
deckGen n possibleEvents =
    Random.List.choices n possibleEvents
        |> Random.map Tuple.first
        |> Random.andThen Random.List.shuffle


getUnits : List Unit -> List Event
getUnits units =
    units
        |> List.map unitToStr
        |> List.map (\x -> Dict.get x unitDict)
        |> List.map (Maybe.withDefault [])
        |> List.concat


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    if msg == Start then
        case model of
            Setup m ->
                ( Play (PlayModel [] (Event "" 0 "") [] 0 m.hardMode)
                , Random.generate HaveDeck (deckGen (m.size + 1) (getUnits m.units))
                )

            _ ->
                init

    else
        ( case model of
            Setup m ->
                updateSetup msg m

            Play m ->
                updatePlay msg m

            -- MoreInfo, Wrong, and Ended are all static pages that you return to a diff one
            MoreInfo _ m ->
                m

            Wrong _ _ _ m ->
                m

            -- The only place to go from ended is reset
            Ended s t ->
                updateEnded msg s t
        , Cmd.none
        )


updateEnded : Msg -> Int -> List Event -> Model
updateEnded msg s t =
    case msg of
        LearnMore e ->
            MoreInfo e (Ended s t)

        _ ->
            Setup (SetupModel [] 7 False)


updateSetup : Msg -> SetupModel -> Model
updateSetup msg model =
    case msg of
        Select u ->
            if List.member u model.units then
                Setup { model | units = listRemove u model.units }

            else
                Setup { model | units = listInsert u model.units }

        ChangeNum s ->
            Setup
                { model
                    | size =
                        Maybe.withDefault
                            (if s /= "" then
                                model.size

                             else
                                0
                            )
                            (String.toInt s)
                }

        LearnMore e ->
            MoreInfo e (Setup model)

        ChangeHardMode ->
            Setup { model | hardMode = not model.hardMode }

        _ ->
            Setup model


updatePlay : Msg -> PlayModel -> Model
updatePlay msg model =
    case msg of
        HaveDeck (first :: second :: rest) ->
            Play (PlayModel rest first [ second ] 0 model.hardMode)

        HaveDeck notLong ->
            Setup (SetupModel [] 7 False)

        Guess d1 d2 ->
            case model.deck of
                [] ->
                    if guessCorrect model.active.date d1 d2 then
                        Ended (model.score + 1) (model.active :: model.played)

                    else
                        Wrong model.active d1 d2 (Ended model.score (model.active :: model.played))

                head :: tail ->
                    if guessCorrect model.active.date d1 d2 then
                        Play
                            { model
                                | deck = tail
                                , active = head
                                , played = model.active :: model.played
                                , score = model.score + 1
                            }

                    else
                        Wrong model.active
                            d1
                            d2
                            (Play
                                { model
                                    | deck = tail
                                    , active = head
                                    , played = model.active :: model.played
                                }
                            )

        LearnMore e ->
            MoreInfo e (Play model)

        _ ->
            Play model


updateMoreInfo : Msg -> Model -> Model
updateMoreInfo msg model =
    model


view : Model -> Browser.Document Msg
view model =
    Browser.Document
        "Timeline"
        [
        Element.layout
            [ padding 20
            , Font.family [ Font.sansSerif ]
            , Background.color ( Element.rgb255 242 241 231 )
            ]
            (column [ width Element.fill ]
            [ case model of
                Setup m ->
                    viewSetup m

                Play m ->
                    viewPlay m

                MoreInfo e m ->
                    viewMoreInfo e

                Wrong e d1 d2 m ->
                    viewWrong e d1 d2

                Ended s l ->
                    viewEnded s l
            , el []
                ( case model of
                        MoreInfo _ _ -> Element.none
                        Wrong _ _ _ _ -> Element.none
                        _ -> Input.button 
                            flashbackBtn
                            { onPress = Just (LearnMore (Event "About Timeline" 0 "Timeline was created by Tobit Glenhaber to help students study for the APUSH exam (or just to learn US History). The code is under a MIT License and is available here: https://github.com/tglenhab/timeline"))
                            , label = text "More info"
                            }
                )
            ])
        ]


viewSetup : SetupModel -> Element Msg
viewSetup model =
    column [ width Element.fill]
        [ el h1 (text "Welcome to timeline!")
        , row
            [ Element.spaceEvenly, width Element.fill ]
            [ column []
                [ el h2 ( text "Select units to study" )
                , column [] (List.map (viewUnitSelect model.units) unitList)
                ]
            , column []
                [ el h2 ( text "Select number of cards to study" )
                --, button [ onClick (ChangeNum (Stringe.fromInt (model.size - 1))) ] [ text "-" ]
                --, input [ onInput ChangeNum, value (String.fromInt model.size) ] []
                --, button [ onClick (ChangeNum (String.fromInt (model.size + 1))) ] [ text "+" ]
                ]
            , column []
                [ el h2 ( text "hard mode" )
                --, input [ onClick ChangeHardMode, type_ "checkbox", checked model.hardMode ] []
                --, text "hard mode"
                --, button [ onClick (LearnMore (Event "About Timeline" 0 "In Hard Mode, you cannot learn about events until they are on the board")) ] [ text "?" ]
                ]
            , Input.button flashbackBtn { onPress = Just Start, label = ( el h3 (text "Start!")) }
            ]
        ]


viewUnitSelect : List Unit -> Unit -> Element Msg
viewUnitSelect mod unit =
    row []
        [ Input.checkbox []
            { onChange = always (Select unit)
            , icon = Input.defaultCheckbox
            , label = Input.labelRight []
                (text (unitPeriod unit))
            , checked = (List.member unit mod)
            }
            -- input
            -- [ onClick (Select unit)
            -- , type_ "checkbox"
            -- , checked (List.member unit mod)
            -- ]
            -- []
        -- , 
        ]


viewPlay : PlayModel -> Element Msg
viewPlay model =
    column [
        width Element.fill
    ]
        [ el h1 ( text "Timeline" )
        , row []
            [ text "event: "
            , el [ Font.underline ] ( text model.active.name )
            , if not model.hardMode then
                el [] ( Input.button flashbackBtn {onPress = Just ( LearnMore model.active ), label = text "learn more"} )

              else
                Element.none
            ]
        , viewTimeline (List.sortBy .date model.played)
        ]


viewTimeline : List Event -> Element Msg
viewTimeline listEvents =
    let
        leftDates : List (Maybe Int)
        leftDates =
            Nothing :: List.map (.date >> Just) listEvents

        rightDates : List (Maybe Int)
        rightDates =
            List.append (List.map (.date >> Just) listEvents) [ Nothing ]

        selectionButtons : List (Element Msg)
        selectionButtons =
            List.map2 (\r l -> el 
                    Styles.selectionBtnBox
                    (Input.button Styles.selectionBtn { onPress = Just (Guess r l), label = text "Tap to place here" })
                )
                leftDates
                rightDates

        placedDates : List (Element Msg)
        placedDates =
            List.map
                (\e ->
                    column 
                        [ Element.centerX
                        , width Element.fill
                        , padding 10
                        , spacing 10
                        , Border.solid
                        -- , Border.width 1
                        , Border.rounded 8
                        , Background.color Styles.mediumBackground
                        , Element.above 
                            ( el 
                                [ Font.size 17
                                , Font.bold
                                , Font.color Styles.white
                                , Element.moveDown 10
                                , Element.centerX
                                , Background.color Styles.colorCorrect
                                , Element.paddingXY 8 5
                                , Border.rounded 19
                                , Border.width 0
                                , Border.color Styles.lightBackground
                                ] 
                                (text (formatYear e.date)) )
                        ]
                        [ paragraph 
                            [ Font.color Styles.eventTextColor
                            , Font.size 15
                            , Font.family 
                                [ Font.typeface "Georgia"
                                , Font.serif ]
                            , Font.medium
                            ] 
                            [ text e.name ]
                        --, button [ onClick (LearnMore e) ] [ text "learn more" ]
                        ]
                )
                listEvents
    in
    column
        [ Element.centerX
        , width (Element.px 360)
        , spacing 20
        ]

    (listInterleave
         selectionButtons
         placedDates
    )



viewMoreInfo : Event -> Element Msg
viewMoreInfo event =
    column []
        [ el h2 ( text event.name )
        , el [] ( text event.desc )
        , Input.button flashbackBtn { onPress = Just Back , label = text "Back" }
        ]


viewWrong : Event -> Maybe Int -> Maybe Int -> Element Msg
viewWrong e d1 d2 =
    column []
        [ el h2 (text "sorry, that's incorrect!")
        , el []
            ( text
                ("you guessed "
                    ++ e.name
                    ++ " occured "
                    ++ betweenStr d1 d2
                    ++ "; it occured in "
                    ++ String.fromInt e.date
                )
            )
        , el [] ( text "-----" )
        , el [] ( text e.desc )
        , Input.button flashbackBtn { onPress = Just Back, label = text "back" }
        ]


viewEnded : Int -> List Event -> Element Msg
viewEnded i listEvents =
    column []
        [ el
            h3
            ( text
                ("You got "
                    ++ String.fromInt i
                    ++ "/"
                    ++ String.fromInt (List.length listEvents - 1)
                )
            )
        , row
            [
            --, style "justify-content" "space-around"
            ]
            (List.map
                (\e ->
                    column [ Border.solid ]
                        [ el h3 ( text e.name )
                        , el [] ( text (formatYear e.date) )
                        --, button [ onClick (LearnMore e) ] [ text "learn more" ]
                        ]
                )
                (List.sortBy .date listEvents)
            )
        , Input.button flashbackBtn { onPress = Just Back, label = ( text "restart" ) }
        ]


subs _ =
    Sub.none

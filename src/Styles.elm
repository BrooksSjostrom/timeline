module Styles exposing (..)
import Element exposing (Attribute, padding, spacing, width, height, px)
import Element.Font as Font
import Element.Background as Background
import Element.Border as Border

black : Element.Color
black = Element.rgb 0 0 0

white : Element.Color
white = Element.rgb 1 1 1

buttonBackground : Element.Color
buttonBackground = Element.rgb255 93 114 201

buttonBackgroundDark : Element.Color
buttonBackgroundDark = Element.rgb255 31 50 130

lightBackground : Element.Color
lightBackground = Element.rgb255 242 241 231

mediumBackground : Element.Color
mediumBackground = Element.rgb255 227 224 213

darkBackground : Element.Color
darkBackground = Element.rgb255 177 174 164

colorCorrect : Element.Color
colorCorrect = Element.rgb255 92 184 135

eventTextColor : Element.Color
eventTextColor = Element.rgba255 18 18 18 0.8

h1 : List (Attribute msg)
h1 = 
    [ Font.size 32, Font.bold, Element.paddingXY 0 10 ]

h2 : List (Attribute msg)
h2 = 
    [ Font.size 24, Font.bold ]

h3 : List (Attribute msg)
h3 = 
    [ Font.size 18, Font.bold ]

btn : List (Attribute msg)
btn = 
    [ Font.color black
    , Background.color (Element.rgb255 239 239 239)
    , Border.rounded 2
    , Border.color (Element.rgb 0 0 0)
    , Border.width 1
    , padding 6
    ]

flashbackBtn : List (Attribute msg)
flashbackBtn = 
    [ Font.color white
    , Background.color buttonBackground
    , Element.mouseOver 
        [ Background.color buttonBackgroundDark ]
    , Element.paddingXY 20 10
    , Border.width 1
    , Border.rounded 20
    ]

selectionBtnBox : List (Attribute msg)
selectionBtnBox = 
    [ width Element.fill
    , height ( px 65 )
    , Border.color darkBackground
    , Border.width 2
    , Border.dashed
    , Border.rounded 8
    ]

selectionBtn : List (Attribute msg)
selectionBtn = 
    [ Border.color buttonBackground
    , Font.color buttonBackground
    , Font.size 16
    , Font.bold
    , Element.centerX
    , Element.centerY
    , Element.mouseOver 
        [ Background.color buttonBackground
        , Font.color white
    ]
    , Border.solid
    , Background.color white
    , Element.paddingXY 20 10
    , Border.width 1
    , Border.rounded 20
    ]
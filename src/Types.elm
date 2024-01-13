module Types exposing (..)


type Model
    = Setup SetupModel
    | Play PlayModel
    | MoreInfo Event Model
    | Wrong Event (Maybe Int) (Maybe Int) Model
    | Ended Int (List Event)


type alias SetupModel =
    { units : List Unit
    , size : Int
    , hardMode : Bool
    }


type alias PlayModel =
    { deck : List Event
    , active : Event
    , played : List Event
    , score : Int
    , hardMode : Bool
    }


type alias Event =
    { name : String
    , date : Int
    , desc : String
    }


type Msg
    = Guess (Maybe Int) (Maybe Int) -- Guess the *active* to be *between* event 1 & 2
    | Select Unit
    | LearnMore Event
    | Back
    | Start
    | ChangeNum String
    | HaveDeck (List Event)
    | ChangeHardMode


type Unit
    = I
    | II
    | III
    | IV
    | V
    | VI


-- Not great that this is needed


unitList : List Unit
unitList =
    [ I, II, III, IV, V, VI]


unitToStr : Unit -> String
unitToStr u =
    case u of
        I -> "I"
        II -> "II"
        III -> "III"
        IV -> "IV"
        V -> "V"
        VI -> "VI"

-- gives a (string) of the start and end dates of the unit
unitPeriod : Unit -> String
unitPeriod u =
    case u of
        I  -> "Antiquity in Africa & China"
        II -> "Late Rome"
        III -> "Early Middle Ages"
        IV -> "Central Middle Ages"
        V -> "High Middle Ages"
        VI -> "Late Middle Ages & Early Modern World"

formatYear : Int -> String
formatYear y =
    if y > 0 then
      String.fromInt y
    else
      (String.fromInt (abs y)) ++ " B.C."

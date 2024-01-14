module EventList exposing (..)

import Dict
import Types exposing (Event)


unitDict : Dict.Dict String (List Event)
unitDict =
    Dict.fromList
        [ ( "III"
          , [ Event "Germanic general Odoacer deposes Romulus Augustulus, last Western Emperor" 476 "No description."
            , Event "Theodoric becomes king of the Ostrogoths" 483 "No description."
            , Event "Death of Theodoric" 526 "No description."
            , Event "Justinian’s general Belisarius defeats Vandals and reconquers N. Africa" 534 "No description."
            , Event "T’ang Dynasty founded in China" 618 "No description."
            , Event "hijra of Muhammad from Mecca to Medina" 622 "No description."
            , Event "Muslim conquest of Syria" 636 "No description."
            , Event "Muslim conquest of Iraq" 637 "No description."
            , Event "Muslim conquest of Egypt" 642 "No description."
            , Event "Muslim Caliph ‘Umar murdered" 644 "No description."
            , Event "Muslim Caliph ‘Uthman assassinated" 656 "No description."
            , Event "‘Ali murdered (revolt led by him against Caliphate ends)" 661 "No description."
            , Event "Muslim conquest of Spain" 711 "No description."
            , Event "Battle of Tours halts Muslim expansion into Europe" 733 "No description."
            , Event "Muslims defeat Chinese near Samarkand (capture Chinese papermakers)" 751 "No description."
            , Event "Spain establishes independent Umayyad Caliphate" 756 "No description."
            ]
          )
        , ( "II"
          , [ Event "Battle of Mulvian Bridge/Conversion of Constantine to Christianity" 312 "No description."
            , Event "Constantine renames Byzantium as Constantinople" 330 "No description."
            , Event "Visigoths enter Western Empire" 395 "No description."
            , Event "Visigoths sack Rome" 410 "No description."
            , Event "Visigoths establish kingdom in Spain" 414 "No description."
            , Event "Vandals establish kingdom in North Africa" 429 "No description."
            , Event "Vandals sack Rome" 455 "No description."
            ]
          )
        , ( "VI"
          , [ Event "Ming Dynasty expels Mongols from China" 1368 "No description."
            , Event "Fall of Constantinople to Ottoman Turks led by Mehmed II" 1453 "No description."
            ]
          )
        , ( "I"
          , [ Event "Assyrians invade lower Egypt. Kush retreats southward." -666 "No description."
            , Event "First Emperor of Qin Dynasty (Shihuangdi) dies – popular rebellion ensues" -210 "No description."
            , Event "Han Dynasty begins" -206 "No description."
            , Event "Emperor Han Wudi establishes Imperial Academy" -124 ""
            , Event "Han Dynasty ends" 220 "No description."
            ]
          )
        , ( "IV"
          , [Event "Pepin the Short succeeds Charles Martel as Mayor of the Palace" 741 "No description."
            , Event "Charlemagne crowned Emperor by Pope Leo III" 800 "No description."
            ]
          )
        , ( "V"
          , [Event "Second Crusade launched – fails to regain land" 1146 "No description."
            , Event "Magna Carta" 1215 "No description."
            ]
          )
        ]

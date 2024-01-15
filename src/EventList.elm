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
            , Event "Mohammed is born" 570 "No description."
            , Event "Papacy of Gregory the Great begins" 590 "No description."
            , Event "Mohammed starts prophesizing" 610 "No description."
            , Event "T’ang Dynasty founded in China" 618 "No description."
            , Event "hijra of Muhammad from Mecca to Medina" 622 "No description."
            , Event "Mohammed dies, Abu Bakr becomes Caliph" 632 "No description."
            , Event "Abu Bakr dies, ‘Umar becomes Caliph" 634 "No description."
            , Event "Muslim conquest of Syria" 636 "No description."
            , Event "Muslim conquest of Iraq" 637 "No description."
            , Event "Muslim conquest of Egypt" 642 "No description."
            , Event "‘Umar murdered, ‘Uthman chosen as next Caliph" 644 "No description."
            , Event "‘Uthman assassinated, ‘Ali becomes Caliph. " 656 "No description."
            , Event "‘Ali murdered, Mu’awiya becomes Caliph (beginning of Umayyad Caliphate)." 661 "No description."
            , Event "Death of Mu’awiya" 680 "No description."
            , Event "Muslim conquest of Spain" 711 "No description."
            , Event "Battle of Tours halts Muslim expansion into Europe" 733 "No description."
            , Event "‘Abbasid Caliphate replaces Umayyad Dynasty" 750 "No description."
            , Event "Muslims defeat Chinese near Samarkand (capture Chinese papermakers)" 751 "No description."
            , Event "Spain establishes independent Umayyad Caliphate" 756 "No description."
            , Event "Muslim capital moves from Damascus to Baghdad" 762 "No description."
            ]
          )
        , ( "II"
          , [ Event "Diocletian becomes Emperor" 284 "No description."
            , Event "Diocletian divides empire" 293 "No description."
            , Event "Diocletian abdicates in East" 305 "No description."
            , Event "Battle of Mulvian Bridge/Conversion of Constantine to Christianity" 312 "No description."
            , Event "Constantine renames Byzantium as Constantinople" 330 "No description."
            , Event "Death of Constantine" 337 "No description."
            , Event "Ostrogoths are subjugated by the Huns" 375 "No description."
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
          , [ Event "Pepin the Short succeeds Charles Martel as Mayor of the Palace" 741 "No description."
            , Event "Pepin the Short dies, Charlemagne becomes king of the Franks (first Carolingian king)" 768 "No description."
            , Event "Charlemagne defeats the Lombards" 774 "No description."
            , Event "Charlemagne crowned Emperor by Pope Leo III" 800 "No description."
            , Event "Charlemagne defeats the Saxons" 804 "No description."
            , Event "Charlemagne dies, his son Louis the Pious is crowned as his successor" 814 "No description."
            , Event "Treaty of Verdun divides Charlemagne’s empire among three sons of Louis the Pious" 843 "No description."
            , Event "Last Carolingian to rule East Frankish Kingdom (Lewis the Child) dies" 911 "No description."
            , Event "Henry I, Duke of Saxony, elected king of East Frankish Kingdom" 918 "No description."
            , Event "Otto I (Otto the Great) succeeds his father Henry I as king, restoring hereditary monarchy." 936 "No description."
            , Event "Coronation of Otto I as Emperor by Pope John XII" 962 "No description."
            , Event "Death of Otto I, Otto II becomes East Frankish King" 973 "No description."
            , Event "Death of Otto II, Otto III becomes East Frankish King" 983 "No description."
            , Event "Ibn Sina born" 980 "No description."
            , Event "Last Carolingian to rule West Frankish kingdom (Louis V) dies, first Capetian (Hugh Capet) elected" 987 "No description."
            
            ]
          )
        , ( "V"
          , [ Event "Second Crusade launched – fails to regain land" 1146 "No description."
            , Event "Magna Carta" 1215 "No description."
            ]
          )
        ]

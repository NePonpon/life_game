#> life_game:load
#
# 初期設定をします。  
# 設定をリセットします。
#
# @within  tag/function minecraft:load

scoreboard objectives add LifeGameCore dummy {"text": "ライフゲーム・コア"}
scoreboard objectives add LifeGameDisplay dummy {"text": "ライフゲームの情報"}
scoreboard objectives add LifeGameCells dummy {"text": "ライフゲーム・セル管理"}
scoreboard objectives add LifeGameClick used:carrot_on_a_stick {"text": "クリック検知"}

#declare entity 次の世代までの残りtick
scoreboard players set 次の世代までの残りtick LifeGameDisplay 10

#declare entity Looping
scoreboard players set Looping LifeGameCore 0

#declare entity CellCountMax
scoreboard players set CellCountMax LifeGameCore 1000

#declare entity Loop_waiting
scoreboard players add Loop_waiting LifeGameCore 0

#declare entity CellCount

scoreboard players set 現在の世代 LifeGameDisplay 0
scoreboard players set warm LifeGameCore 0

scoreboard objectives setdisplay sidebar LifeGameDisplay

#必要なゲーム設定
gamerule sendCommandFeedback false
gamerule logAdminCommands false
gamerule doMobSpawning false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
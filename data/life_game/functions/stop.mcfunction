scoreboard players set 現在の世代 LifeGameDisplay 0
tellraw @a [{"text": "世代数をリセットしました","bold": true}]
scoreboard players set Loop_waiting LifeGameCore 0

scoreboard players set warm LifeGameCore 0

execute at @e[tag=LifeGame] run setblock ~ ~-1 ~ black_concrete
kill @e[tag=LifeGame]
scoreboard players set CellCount LifeGameCore 0
tellraw @a [{"text": "セルリセット","color": "green","bold": true}]

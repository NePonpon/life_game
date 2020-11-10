#生存セルの周りに死亡セルを設置
execute as @e[tag=Live] at @s positioned ~1 ~ ~ unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~-1 ~ ~ unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~ ~ ~1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~ ~ ~-1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~1 ~ ~1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~1 ~ ~-1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~-1 ~ ~1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}
execute as @e[tag=Live] at @s positioned ~-1 ~ ~-1 unless entity @e[distance=..0.2,tag=LifeGame] run summon armor_stand ~ ~ ~ {Tags:["LifeGame","Death"],Small:true,Invisible:true,Marker:true,NoGravity:true}

#生存セル、死亡セルの周りの生存セルの数を取得
execute as @e[tag=LifeGame] run execute as @s[tag=Live] store result score @s LifeGameCore run execute as @s at @s if entity @e[tag=Live,distance=0.1..1.5]
execute as @e[tag=LifeGame] run execute as @s[tag=Death] store result score @s LifeGameCore run execute as @s at @s if entity @e[tag=Live,distance=0.1..1.5]

#scoreboard players remove @e[tag=LifeGame] LifeGameCore 1

#法則にのっとって死亡させる
execute at @e[tag=Live,scores={LifeGameCore=..1}] run setblock ~ ~-1 ~ black_concrete
execute at @e[tag=Live,scores={LifeGameCore=4..}] run setblock ~ ~-1 ~ black_concrete

#法則にのっとって誕生させる
execute as @e[tag=Death,scores={LifeGameCore=3}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["LifeGame","Live","set"],Small:true,Invisible:true,Marker:true,NoGravity:true}

#死亡セル削除
kill @e[tag=Death]

scoreboard players add 現在の世代 LifeGameDisplay 1

#セル数の上限に達したらループ強制停止
execute store result score CellCount LifeGameCore run execute if entity @e[tag=Live]
execute if score CellCount LifeGameCore >= CellCountMax LifeGameCore run scoreboard players set Looping LifeGameCore 0
execute if score Looping LifeGameCore matches ..0 if score CellCount LifeGameCore >= CellCountMax LifeGameCore run tellraw @a [{"text": "セルの上限に達したため強制停止","bold": true,"color": "red"},{"text": "\n周期数、セルのリセット","bold": true,"clickEvent": {"action": "run_command","value": "/function life_game:stop"}},{"text": " ←クリック！","bold": false}]
execute if score Looping LifeGameCore matches ..0 if score CellCount LifeGameCore >= CellCountMax LifeGameCore run scoreboard players set warm LifeGameCore 1

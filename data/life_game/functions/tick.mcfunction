#> life_game:tick
#
# tick処理  
# ゲームの状態を管理する
#
# @within tag/function minecraft:tick

#生存セル重複時死亡処理
execute as @e[tag=seted] store result score @s LifeGameCore at @s if entity @e[tag=set,distance=0..0.2]
execute as @e[tag=seted,scores={LifeGameCore=1..}] at @s run kill @e[tag=set,distance=0..0.2]
execute as @e[tag=seted,scores={LifeGameCore=1..}] at @s run setblock ~ ~-1 ~ black_concrete

#セルの生存、死亡のブロック設置処理
execute as @e[tag=set] at @s unless block ~ ~-1 ~ lime_concrete run setblock ~ ~-1 ~ lime_concrete
execute as @e[tag=set] at @s if block ~ ~-1 ~ lime_concrete run tag @s add seted
execute as @e[tag=set] at @s if block ~ ~-1 ~ lime_concrete run tag @s[tag=seted] remove set
execute as @e[tag=seted] at @s unless block ~ ~-1 ~ lime_concrete run setblock ~ ~-1 ~ black_concrete
execute as @e[tag=seted] at @s if block ~ ~-1 ~ black_concrete run kill @s

#次の世代までの残りtick調整
execute as @a[scores={LifeGameClick=1..}] if data entity @s {SelectedItem:{tag:{waitset:true}}} run tellraw @s [{"text": "次の世代までのtick数を設定します。\n数字をクリックして調節して下さい\n","color": "dark_aqua","bold":true},{"text": "注意:2tick未満にすることは出来ません\n\n","color": "red","bold": false},{"text": " "},{"text": "-10","bold": true,"clickEvent": {"action": "run_command","value": "/scoreboard players remove 次の世代までの残りtick LifeGameDisplay 10"}},{"text": "  "},{"text": "-1","clickEvent": {"action":"run_command","value": "/scoreboard players remove 次の世代までの残りtick LifeGameDisplay 1"}},{"text": "  "},{"text": "+1","clickEvent": {"action":"run_command","value": "/scoreboard players add 次の世代までの残りtick LifeGameDisplay 1"}},{"text": "  "},{"text": "+10","clickEvent": {"action":"run_command","value": "/scoreboard players add 次の世代までの残りtick LifeGameDisplay 10"}}]
execute if score 次の世代までの残りtick LifeGameDisplay matches ..1 run scoreboard players set 次の世代までの残りtick LifeGameDisplay 2

#世代更新functionへの分岐
execute as @a store result score Looping LifeGameCore if score warm LifeGameCore matches ..0 run data get entity @s SelectedItem.tag.Loop
execute if score Looping LifeGameCore matches 1 if score Loop_waiting LifeGameCore matches ..0 run scoreboard players operation Loop_waiting LifeGameCore = 次の世代までの残りtick LifeGameDisplay
execute if score Loop_waiting LifeGameCore matches 0.. run scoreboard players remove Loop_waiting LifeGameCore 1
execute if score Loop_waiting LifeGameCore matches ..0 if score Looping LifeGameCore matches 1 run function life_game:main
execute if entity @a[scores={LifeGameClick=1..},nbt={SelectedItem:{tag:{Once:true}}}] run function life_game:main
execute if score Looping LifeGameCore matches ..0 run scoreboard players set Loop_waiting LifeGameCore 0

#世代とセルリセットfunctionへの分岐
execute if entity @a[scores={LifeGameClick=1..},nbt={SelectedItem:{tag:{reset:true}}}] run function life_game:stop

#現在のセルの数を表示
execute store result score 生きているセルの数 LifeGameDisplay if entity @e[tag=Live]

#必ず最後のコマンドにする
#各種検知スコアをリセット
scoreboard players set Looping LifeGameCore 0
scoreboard players reset @a LifeGameClick
execute as @a unless data entity @s {SelectedItem:{tag:{Loop:1}}} run scoreboard players set warm LifeGameCore 0
#> life_game:block_seted.macro
#
# 生存セルの下のブロックが消えていれば死亡させます。
#
# @within function life_game:main

$execute as @e[tag=seted] at @s unless block ~ ~-1 ~ $(live_block) run setblock ~ ~-1 ~ black_concrete
execute as @e[tag=seted] at @s if block ~ ~-1 ~ black_concrete run kill @s
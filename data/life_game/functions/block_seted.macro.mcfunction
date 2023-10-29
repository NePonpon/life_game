$execute as @e[tag=seted] at @s unless block ~ ~-1 ~ $(live_block) run setblock ~ ~-1 ~ black_concrete
execute as @e[tag=seted] at @s if block ~ ~-1 ~ black_concrete run kill @s
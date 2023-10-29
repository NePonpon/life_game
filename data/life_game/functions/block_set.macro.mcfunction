$execute as @e[tag=set] at @s unless block ~ ~-1 ~ $(live_block) run setblock ~ ~-1 ~ $(live_block)
$execute as @e[tag=set] at @s if block ~ ~-1 ~ $(live_block) run tag @s add seted
$execute as @e[tag=set] at @s if block ~ ~-1 ~ $(live_block) run tag @s[tag=seted] remove set
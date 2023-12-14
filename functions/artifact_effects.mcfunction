effect @a[hasitem={location=slot.armor.feet, item=artifact:boots_of_hermes}] speed 1 5 true
effect @a[hasitem={location=slot.weapon.offhand, item=artifact:the_one_ring}] invisibility 1 1 true
effect @a[hasitem={location=slot.weapon.mainhand, item=artifact:the_one_ring}] invisibility 1 1 true

execute at @e[scores={is_frozen=1..}] run particle minecraft:snowflake_particle ~ ~ ~
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~0.5 ~1 ~0.5
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~-0.5 ~1 ~0.5
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~-0.5 ~1 ~-0.5
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~0.5 ~1 ~-0.5

execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~0.75 ~1 ~
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~ ~1 ~0.75
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~-0.75 ~1 ~
execute at @e[scores={is_frozen=1..}] run particle minecraft:blue_flame_particle ~ ~1 ~-0.75
scoreboard players remove @e[scores={is_frozen=1..}] is_frozen 1

execute at @a[hasitem={location=slot.weapon.mainhand, item=artifact:starvation_medallion}] run effect @a[rm=1,r=10] hunger 1 1 true
execute at @a[hasitem={location=slot.weapon.offhand, item=artifact:starvation_medallion}] run effect @a[rm=1,r=10] hunger 1 1 true

execute at @e[scores={is_snowing=1..}] positioned ~ ~0.8 ~ run tp @e[type=artifact:target_dummy,c=1] ^ ^ ^2
execute at @e[scores={is_snowing=1..}] positioned ~ ~0.8 ~ run tp @e[type=artifact:snowball_dummy,c=1] ^ ^ ^1
execute as @a[scores={is_snowing=1}] run kill @e[type=artifact:snowball_dummy]
execute as @a[scores={is_snowing=1}] run kill @e[type=artifact:target_dummy]
scoreboard players remove @e[type=artifact:countdown,scores={snowing_cooldown=1..}] snowing_cooldown 1
scoreboard players remove @e[scores={is_snowing=1..}] is_snowing 1

execute as @e[type=artifact:countdown,scores={snowing_cooldown=0}] run replaceitem entity @a[hasitem={item=artifact:empty_cum_bucket,location=slot.weapon.mainhand}] slot.weapon.mainhand 0 destroy artifact:cum_bucket 1 0

execute as @e[scores={kb_time=1..}] run scoreboard players remove @s kb_time 1

scoreboard players remove @e[type=artifact:countdown,scores={mushroom_cooldown=1..}] mushroom_cooldown 1
execute as @e[type=artifact:countdown,scores={mushroom_cooldown=0}] run replaceitem entity @a[hasitem={item=artifact:used_berserker_mushroom,location=slot.weapon.mainhand}] slot.weapon.mainhand 0 destroy artifact:berserker_mushroom 1 0
execute as @a[scores={is_powerful=1}] run effect @p nausea 60 2 true
scoreboard players remove @e[scores={is_powerful=1..}] is_powerful 1

scoreboard players add @a[scores={sniper_charge=1..}] sniper_charge 1
execute as @a[scores={sniper_charge=40..}] run tag @e[family=sniper_arrow] add valid_sniper_arrow
execute as @e[family=sniper_arrow,tag=!valid_sniper_arrow] run give @p arrow
execute as @e[family=sniper_arrow,tag=!valid_sniper_arrow] run kill @s

scoreboard players remove @e[type=artifact:countdown,scores={tablet_cooldown=1..}] tablet_cooldown 1
#> life_game:item_get
#
# ゲームの制御に必要なアイテムを配布します。
#
# @user

give @s armor_stand{EntityTag:{Tags:["LifeGame","Live","set"],Small:true,Invisible:true,Marker:true,NoGravity:true},Enchantments:[{}],display:{Name:'{"text":"セル(状態切り替え)","color":"green"}',Lore:['{"text":"設置すると下のセルを生存化させたり死亡させたりする","color":"green","bold":true}','{"text":"生きているセルを破壊すると死亡する","color":"red"}']}}
give @s stick{display:{Name:'{"text":"時間進行棒"}',Lore:['{"text":"この棒を持っていると、時間が進む","bold":true}','{"text":"一定時間たつと世代が進む"}']},Enchantments:[{}],Loop:1}
give @s carrot_on_a_stick{display:{Name:'{"text":"時間進行棒"}',Lore:['{"text":"この棒をクリックすると、時間が進む","bold":true}','{"text":"一回のクリックで一世代が進む"}']},Enchantments:[{}],Once:true}
give @s carrot_on_a_stick{display:{Name:'{"text":"時間制御棒"}',Lore:['{"text":"この棒をクリックすると、時間を制御できる","bold":true}','{"text":"次の世代までの残りtick数を調整できる"}']},Enchantments:[{}],waitset:true}
give @s carrot_on_a_stick{display:{Name:'{"text":"リセット棒"}',Lore:['{"text":"この棒をクリックすると、世代数とセルをリセットする","bold":true}']},Enchantments:[{}],reset:true}
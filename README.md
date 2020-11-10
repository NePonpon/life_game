# Life_Game Datapack
製作：Ponpon
対応バージョン：ver 1.16.4

---
## 概要
マインクラフトの中でシミュレーションをしよう！
ライフゲームってなに？って人は、[こちら](https://ja.wikipedia.org/wiki/ライフゲーム "Wikipedia - ライフゲーム")をチェックしてください。
このデータパックでは、死亡状態のセルを黒のコンクリ－ト 生存状態のセルを黄緑のコンクリートで表します。

---
## 遊び方
まずは遊ぶためのフィールドを用意しなければなりません。
ワールドを新規作成します。その際、ダウンロードしたzipファイルの中にある、**worldgen_settings_export.json**を使って、専用のスーパーフラットワールドを作成してください。

###### ワールド設定の仕方
ゲームモードはクリエイティブ、難易度はピースフルが望ましいです。
データパックというところで今回の**life_game**データパックを導入しておくと後々楽です。
その他の設定を開き、設定を読み込むを選択。**worldgen_settings_export.json**を選択すると、自動的にスーパーフラットの設定をしてくれます。

ワールドに入ったら、このような画面になっていると思います。
![ワールド新規作成後](http://uploader.sakura.ne.jp/src/up178230.png)
なっていなければ、データパックが正しく導入されているか確認して再度ワールドに入り直してください。

---
### アイテムの取得方法
このデータパックでは５つのアイテムを使ってシミュレーションを実行します。
1 セル(状態切り替え) - アーマースタンド ,  
2 時間進行棒 (常時進行) - 棒 ,  
3 時間進行棒 (一回進行) - 人参付きの棒 ,  
4 時間制御棒 - 人参付きの棒 ,  
5 リセット棒 - 人参付きの棒  
    
`/function life_game:item_get`のコマンドをチャットから実行すると上のアイテムを取得できます。

##### セル(状態切り替え)
周りの死亡状態のセルのブロックにアーマースタンドを設置すると、セルが誕生します。
また、生存状態のセルのブロックに設置すると、セルが死亡します。
このほか、生存状態のセルのブロックを壊すと、セルが死亡します。

##### 時間進行棒
  1.常時進行
棒を持っていると世代が進んでいきます。手から離すとストップします。

  2.一回進行
人参付きの棒を右クリックすると、一世代だけ進みます。

##### 時間制御棒
このアイテムを右クリックすると「時間進行棒 (常時進行)」を持っているとき、何tickごとに世代が進んでいくかの設定ができます。
2tick未満の値には設定できません。

##### リセット棒
このアイテムを右クリックすると、現在生存しているセルをすべて死亡させ、世代数をリセットさせます。

---
## 補足
##### セルの上限について
生存しているセルが大体1000個を超えると強制停止します。
これは、エンティティ数の増加で重くなり、操作不能になることを防ぐためです。
この上限は、以下のコマンドで変更できます。
`/scoreboard players set CellCountMax LifeGameCore 1000`

##### リロード時のスコアリセットについて
ワールドに入り直したり、reloadコマンドを実行したりすると、設定したスコアはすべてリセットされます。
これを防ぐためには直接functionファイルを弄る必要があります。

---
## 技術情報
##### 使用スコア名

>LifeGameCore ,
>LifeGameDisplay ,
>LifeGameCells ,
>LifeGameClick

##### 使用タグ名
>LifeGame ,
>Live ,
>Death ,
>set ,
>seted

##### 更新内容
ver 1.0

---
## 問い合わせ
TwitterのDMなどでお気軽にご連絡をください
[Twitter/ @nepon13](twitter.com/nepon13)

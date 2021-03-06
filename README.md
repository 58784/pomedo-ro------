# サービス概要
画面のはじっこに癒しキャラを置いてタイマーアプリ

# メインのターゲットユーザー
時間管理苦手な人<br>
可愛いものが好きな人<br>
日々の日常に少しでも彩りをつけたい人

# ユーザーが抱える課題
タスク管理が苦手な方の多くは期限を守れない、つまり時間管理が上手ではない可能性がある。<br>
時間管理を出来るようにタイマーを使うが、ただ無機質な数字だけの画面を見てもやる気が起こらない。

タスクなどを行う上で、時間管理としてタイマーを利用するが、
ただ無機質な数字だけの画面を見てもやる気が起こらない。

# 解決方法
画面上にキャラクターを配置し、<br>
時間経過によりキャラクターの動きが変化することで<br>
日々のタスクを少しでも癒やしを加え、モチベーションを上げる。

# 実装予定の機能
・ログイン機能<br>
・ポモドーロ機能のCRUD<br>
・キャラクター選択<br>
・通知音選択<br>
・音量調整<br>
・キャラクターの画面上配置移動

# なぜこのサービスを作りたいのか？
勉強中、休憩時間を取ろうとした時に無機質な数字だけの画面を見るのが嫌になったので<br>
それだったら可愛くしてやろうと思いました。

# イメージ図
[![Image from Gyazo](https://i.gyazo.com/46c5eaeab101c975f92be9e5d3399c27.png)](https://gyazo.com/46c5eaeab101c975f92be9e5d3399c27)

# 画面遷移図
[画面遷移](https://www.figma.com/file/tQ1GWcTLn2PPqpEKpPRVUf/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=3%3A3)

# ER図
[ER図](https://drive.google.com/file/d/1crUjsJVvBXVs7idGJzqUS9QXrAEmxRJd/view?usp=sharing)

### Userテーブル
has_many: Timer<br>
・email ▶︎string<br>
・password_digest ▶︎string 

### Timerテーブル
belongs to: User<br>
・name ▶︎string<br>
・work_time(ポモドーロの25分に該当する箇所) ▶︎time<br>
・rest_time(ポモドーロの5分休憩に該当する箇所) ▶︎time<br>
・implementation_time(ポモドーロを◯時~◯時の間実行する時間) ▶︎time<br>
・switch(ON/OFFの切り替え) ▶︎boolean<br>
・repetition(くり返し) ▶︎enum<br>
・character ▶︎enum<br>
・sound ▶︎integer

# スケジュール
README〜ER図作成：5/7 〆切<br>
メイン機能実装：5/8 - 6/8<br>
β版をRUNTEQ内リリース（MVP）：6/8〆切<br>
本番リリース：6月末
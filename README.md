# minimal closet
<img width="1436" alt="スクリーンショット 2020-04-28 15 57 31" src="https://user-images.githubusercontent.com/59720615/80457843-e9300b00-896a-11ea-942d-d2f0eda995c0.png">

## サイト概要
ミニマリストになりたい人、ミニマリストのためのクローゼット管理アプリケーション。

自分の持っているアイテムを写真に撮って保存し、カテゴリーごと（トップス、ボトムスなど）に一覧で表示できます。

コーディネート保存機能（コーディネートを考える手間をなくす）、

カレンダーにコーディネートを保存する機能（いつも同じ服と思われないために）、

着用回数カウント機能もあります。

他ユーザーのクローゼット、コーディネートを閲覧し、いいね、フォローをすることができます。

### サイトテーマ
ミニマリストになりたい人、ミニマリストのためのクローゼット管理アプリケーション。

自分の持っているアイテムを写真で保存し、カテゴリーごとに一覧で見える化します。

必要以上に買ってしまう、似たようなものばかり買ってしまう悩みを解決し、服を適正量にしていきます。


### テーマを選んだ理由
私自身ミニマリストになりたいと思っているのですが、なかなか減らせないのが服。

必要でなくてもいいなと思ったら買ってしまうことが多く、自分の中の適正量を超えていると感じていました。

見える化し、数を把握することで、強制的に服を減らせるようになるのではないかと考えました。


### ターゲットユーザ
20~30代の服を減らしたいと思っている女性。

### 主な利用シーン
- 買い物をするとき
- コーディネートを考えるとき
- 服を減らしたいと思っているとき

## 使用技術
### フロントエンド
- HTML&CSS
- jQuery
### バックエンド
- Ruby2.5.7
- Ruby on Rails5.2.4.2
### 開発環境
- Vagrant
### インフラ
- AWS(EC2,RDS)
- Nginx
- Puma

## URL
http://18.178.164.47/
- テストユーザー
  - ニックネーム：のせっち、パスワード：nnnnnn
  - ニックネーム：モモコ、パスワード：mmmmmm
  - ニックネーム：菫、パスワード：ssssss


## 設計書
### 機能一覧
https://docs.google.com/spreadsheets/d/1A9BcG6NJbHddkaWGqMHFYq5xGgQDkPhR992HZPUC7f8/edit#gid=0

### ER図
https://app.diagrams.net/#G1fRviMhhhChFRmU9iRodaax_GNZHQvItQ

### テーブル定義書
https://docs.google.com/spreadsheets/d/13iQRe0q3L4oSksETKsHX0SSRvbp0cHiT/edit#gid=397272164

### UI Flows
https://www.draw.io/#G1Kd7LGtj608lye4Oci3xfuRkcgEuAend6

### ワイヤーフレーム
https://app.diagrams.net/#G1VxPAY0wqWeVh8q6bG2C5srY1JknapgAd

### アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/1LVmn4lmotH9WzyePGldbP1MD-38VipvoPy5411ssaEY/edit#gid=1149508897
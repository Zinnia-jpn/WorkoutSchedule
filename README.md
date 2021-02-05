# APP名: ワークアウト管理App

### URL: https://www.sm-portforio-workout-schedule.ml

ワークアウトの予定や実施済みの項目を簡単に記録できるアプリです。<br>
無酸素運動と有酸素運動で入力項目が異なり、詳細まで記録することができます。<br>
また、日ごと・月ごとにスケジュールを確認できるので、手軽に予定の確認・振り返りをしていただけます。

### 機能
#### 全般

* レスポンシブデザイン(スマホ, タブレット, PC)
  - スマホサイズになるとヘッダーメニューがアイコンに収納される
  
<img src="https://user-images.githubusercontent.com/66233629/106972406-2942da80-6794-11eb-8812-8de60a3d948f.png" width="200px">

#### セッション関連

* ログイン・ログアウト
* Cookieを利用したログイン情報の保存

<img src="https://user-images.githubusercontent.com/66233629/106972764-de759280-6794-11eb-8477-e023e982dd70.png" width="250px">

#### ユーザー関連

* ユーザー作成・閲覧・編集・削除
* プロフィール画像のアップロード・初期化

##### > ユーザー閲覧画面 / ユーザー編集画面

<img src="https://user-images.githubusercontent.com/66233629/106971501-6ad28600-6792-11eb-9455-4708742fe4d0.png" width="250px"> <img src="https://user-images.githubusercontent.com/66233629/106971512-6dcd7680-6792-11eb-8090-373ea167e7bb.png" width="250px">

#### 記録関連

* ワークアウトの記録・編集・削除
* 無酸素運動・有酸素運動によって記録項目が変動
  - カテゴリを選択すると有酸素・無酸素を判断し、ロードなしでフォームを切り替える (Ajax通信)
* 記録を作成・編集した後は、記録した予定・実施日の日ごとスケジュールへ遷移する

##### > 無酸素運動の記録画面 / 有酸素運動の記録画面

<img src="https://user-images.githubusercontent.com/66233629/106970310-f0086b80-678f-11eb-9313-957a0713d9e8.png" width="250px"> <img src="https://user-images.githubusercontent.com/66233629/106970336-fe568780-678f-11eb-9b08-dcd406027251.png" width="250px">

#### スケジュール関連

* 日ごと・月ごとの切り替え
  - 日ごとは詳細まで確認可能
  - 月ごとは情報を一部簡略化して表示しており、記録を俯瞰して見られる
* 記録の編集・削除へのリンク

##### > 日ごとのスケジュール画面 / 月ごとのスケジュール画面

<img src="https://user-images.githubusercontent.com/66233629/106973060-6f4c6e00-6795-11eb-8532-811e813f019b.png" width="250px"> <img src="https://user-images.githubusercontent.com/66233629/106972981-43c98380-6795-11eb-9679-1097ffc952b2.png" width="250px">

## 使用技術

### 基本構成

* Appサーバー: Rails 6.0.3.3 (Ruby 2.7.1)
* Webサーバー: nginx 1.19.6
* DBサーバー: MySql 8.0.2

### その他

* HTML5 / CSS3 / Sass / Bootstrap 4.3.1
* Javascript / jQuery 3.5.1
* Rspec

* Git / GitHub
* Docker / Docker-compose
* CircleCi
* AWS
  - IAM
  - VPC, EIP
  - EC2, ALB, ACM
  - ECR, ECS
  - RDS, S3

#### インフラ構成図

<img src="https://user-images.githubusercontent.com/66233629/106969769-d87cb300-678e-11eb-801c-cc32db299559.png" width="850px">

#### Rails内で使用したGem

* Bcrypt (パスワードのハッシュ化)
* I18n (国際化)
* Carrierwave (画像アップロード機能)
* Minimagick (画像のリサイズ)
* Uuid (アップロードされた画像名を変更)
  - SecureRandom.uuidで代用できるなら削除
* Rspec-rails (テストケース作成)
* Capybara (Rspecテストでのブラウザ操作)
* Rails-controller-testing (Rspecにてコントローラー内のインスタンス変数を取得)
  - 非推奨のため、このgemを使わないテスト方法・方針を模索
* Database_cleaner (Rspecテストで使用したデータを削除する)
* fog (AWSのS3に画像を保存)

#### Rspecテスト

* Modelテスト
* Requestテスト (途中)

* Featureテスト (未実装)
* Systemテスト (未実装)

## ライセンス (License)

This software is released under the MIT License, see LICENSE.txt.

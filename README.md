# ワークアウト管理App
#### URL: (未デプロイ)

ワークアウトの予定や実施済みの項目を簡単に記録できるアプリです。<br>
無酸素運動と有酸素運動で入力項目が異なり、詳細まで記録することができます。<br>
また、日ごと・月ごとにスケジュールを確認できるので、予定の確認や振り返りを手軽にしていただけます。

### 機能
#### セッション関連

* ログイン・ログアウト
* Cookieを利用したログイン情報の保存

#### ユーザー関連

* ユーザー作成・閲覧・編集・削除
* プロフィール画像のアップロード・初期化

#### 記録関連

* ワークアウトの記録・編集・削除
* 無酸素運動・有酸素運動によって記録項目が変動
  - カテゴリを選択すると有酸素・無酸素を判断し、ロードなしでフォームを切り替える (Ajax通信)
* 記録を作成・編集した後は、記録した予定・実施日の日ごとスケジュールへ遷移する

#### スケジュール関連

* 日ごと・月ごとの切り替え
  - 日ごとは詳細まで確認可能
  - 月ごとは情報を一部簡略化して表示しており、記録を俯瞰して見られる
* 記録の編集・削除へのリンク

## 使用技術
### フロントエンド

* HTML5 / CSS3 / Sass / Bootstrap
* Javascript / jQuery 3.4.1
  
### バックエンド

* Ruby 2.7.1p83
* Rails 6.0.3.3
* Rspec

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
  - 非推奨のため、このgemを使わないテスト方法・方針を模索する
* Database_cleaner (Rspecテストで使用したデータを削除する)

#### Rspecテスト

* Modelテスト
* Requestテスト (途中)

* Featureテスト (未実装)
* Systemテスト (未実装)

### インフラ

* MySql 8.0.22 for osx10.14 on x86_64 (Homebrew)
* Git / GitHub

#### (予定)
* nginx 1.18
* Docker / Docker-compose
* CircleCi
* AWS ( EC2, ALB, ACM, S3, RDS, CodeDeploy, SNS, Chatbot, CloudFormation, Route53, VPC, EIP, IAM )
* terraform

#### インフラ構成図
(未作成)

## ライセンス (License)
This software is released under the MIT License, see LICENSE.txt.

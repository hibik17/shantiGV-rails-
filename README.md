## GVReviewApp
- auther(hibik17)
- date(2021/10 ~ 2021/11)

## Description
- habitat for humanityと共同で行っている海外派遣ボランティアの活動の記録を残すサイト

## deploy
- heroku
  - [GvReviewApp](http://gvreview.herokuapp.com/)

## lauguage
- ruby(2.6.8)
- Ruby on rails (5.2.5) 
- Javascript(jquery)
- css(semantic UI)

## Improvement　Tool
- プロダクトのフィードバックツール
  - [google　questionnaire](https://docs.google.com/forms/d/1TeX5Ub71cEIvDSZjP9Sbm4qZ_BtMrmZipzUUGVUdWK8/prefill)
- Todoの管理
  - [trello](https://trello.com/invite/b/D1rK8EKe/c7feaf598e1caa4676bc2ba77f3bdc5d/portfolio)

## Usage
### 会員側実装機能
- 顧客は会員登録、ログイン・ログアウト、退会ができる
- 会員のログインはメールアドレスとパスワードで行う
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できるようにする
- 会員の登録は_googleAuth_を使用して登録が行うことができる
- 会員同士のフォロー機能
- 投稿に対していいねをつけることができ、後で投稿を閲覧しておくことが可能
- 各投稿に対してコメントをつけることが可能
- キーワードを入力し投稿の検索を実装（キーワードをもとに前テーブルから検索結果を出力）
- topページに実際のボランティア記録のスライドショーを実装
- 会員の管理は論理実装を採用
- ページングの実装
- エラーメッセージの日本語化
### 管理者側の実装
- 全会員の管理（悪質な会員を非会員に変更)
- 会員の検索を実装
- 投稿の管理（悪質なコメントを削除）
- 投稿を検索を実装
- 投稿ジャンルの追加・削除
- 投稿に対する国の追加

## Gem
- kaminari(ページング）
- paranoia(論理削除）
- rails-i18n(エラーメッセージの日本語化）
- omniauth-google-oauth2(google auth）
- devise(会員登録）
- dotenv-rails(APIkey管理）

## Start!
1. ```bundle install```
2. ```rails db:migrate```
3. ```rails s```

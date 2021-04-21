# 今日の積み上げアプリ
スキルアップのための努力を、みんなで報告しあうwebアプリです。<br >
他の人の投稿に3回いいね！する毎に1回自分の投稿をすることができます。<br >
報告に対してお互いにいいね！しあうことでモチベーション維持に活用してもらうことが目的です。<br >
マイページでは他の人からもらったいいね！の数の確認や、投稿日が反映されたカレンダーを表示させることができます。
![画像名](https://github.com/arakaki0/tumiage/blob/master/sample_image1.png)
![画像名](https://github.com/arakaki0/tumiage/blob/master/sample_image3.png)
![画像名](https://github.com/arakaki0/tumiage/blob/master/sample_image2.png)
# URL
https://www.tumiage-app.com
# テストアカウント
テスト用のアカウントを用意しています。<br >
ログインボタンを押してメールとパスワードを入力して利用してください。<br >
Email: jotaro@mail<br >
Password: kujokujo
# 使用技術
- ruby 2.6.6
- Rails 5.2.4.5
- MySQL 8.0.23
- Bulma-rails
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - ALB
  - Route53
- RSpec
- Rubocop
# AWS構成図
![画像名](https://github.com/arakaki0/tumiage/blob/master/tumiage-app%20aws%E6%A7%8B%E6%88%90%E5%9B%B3.svg)
# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 画像投稿機能(carrierwave)
- カレンダー機能(simple_calendar2.0)
# ER図
![画像名](https://github.com/arakaki0/tumiage/blob/master/tumiage-app%20ER%E5%9B%B3.svg)
# テスト
- RSpec
  - 単体テスト(model)
  - 統合テスト(system)

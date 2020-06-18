# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  name: "トップス"
)
Category.create!(
  name: "ワンピース"
)
Category.create!(
  name: "セットアップ"
)
Category.create!(
  name: "ボトムス"
)
Category.create!(
  name: "アウター"
)
Category.create!(
  name: "シューズ"
)
Category.create!(
  name: "バッグ"
)
Category.create!(
  name: "小物"
)

Scene.create!(
  name: "プライベート"
)
Scene.create!(
  name: "ビジネス"
)
Scene.create!(
  name: "趣味・スポーツ"
)
Scene.create!(
  name: "パーティー"
)
Scene.create!(
  name: "冠婚葬祭"
)
Scene.create!(
  name: "その他"
)

Season.create!(
  name: "春"
)
Season.create!(
  name: "夏"
)
Season.create!(
  name: "秋"
)
Season.create!(
  name: "冬"
)
Season.create!(
  name: "春秋"
)
Season.create!(
  name: "オールシーズン"
)

User.create!(
  name: "のせっち",
  email: "n@test.com",
  password: "nnnnnn"
)
User.create!(
  name: "モモコ",
  email: "m@test.com",
  password: "mmmmmm"
)
User.create!(
  name: "菫",
  email: "s@test.com",
  password: "ssssss"
)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
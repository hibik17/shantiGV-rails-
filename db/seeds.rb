# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
  User.create!(
    name: "test#{n}人目",
    profile: "test！#{n}回目",
    email: "test#{n}@gmail.com",
    password: 'pass#{n}'
    )
  Genre.create!(
    name: '#{n}'
    )
  Country.create!(
    name: '#{n}'
    )
  Post.create!(
    genre_id: 1,
    user_id: 1,
    country_id: 1,
    title: '#{n}番目の投稿',
    post_user: 'test',
    content: '#{n}番目のcontent'
  )
end
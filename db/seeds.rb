# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 50.times do |n|
#   User.create!(
#     name: "test#{n}人目",
#     profile: "test！#{n}回目",
#     email: "test#{n}@gmail.com",
#     password: 'pass#{n}'
#     )
#   Genre.create!(
#     name: '#{n}'
#     )
#   Country.create!(
#     name: '#{n}'
#     )
#   Post.create!(
#     genre_id: 1,
#     user_id: 1,
#     country_id: 1,
#     title: '#{n}番目の投稿',
#     post_user: 'test',
#     content: '#{n}番目のcontent'
#   )
# end

countries = {'インドネシア' => 1, 'マレーシア' => 2, 'カンボジア' => 3}

countries.each do |key, value|
  Country.create!(
    id: value,
    name: key
  )
end

genres = {'お金に関して' => 1, '観光に関して' => 2, '実際のボランティアに関して' => 3}

genres.each do |key, value|
  Genre.create!(
    id: value,
    name: key
  )
end
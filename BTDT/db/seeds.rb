# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'pry'

flags_file = File.read("./flags.json")
flags_hash = JSON.parse(flags_file)


5.times do
  Country.create(
    name: Faker::Address.country,
    language: Faker::Nation.language,
    emoji: Faker::Nation.flag
  )
end

5.times do
  User.create(
    name: Faker::Name.name,
    age: rand(18...95),
    country: Country.all.sample,
    profile_pic: Faker::Address.city,
    points: 10,
    # password_digest: "123"
  )
end

20.times do
  Visit.create(
    country_id: Country.all.sample.id,
    user_id: User.all.sample.id
)
end

10.times do
  Post.create(
    title: Faker::Books::Dune.title,
    content: Faker::Books::Dune.quote,
    user_id: User.all.sample.id
  )
end

20.times do
  Comment.create(
    text: Faker::Books::Dune.quote,
    user_id: User.all.sample.id,
    post_id: Post.all.sample.id
  )
end

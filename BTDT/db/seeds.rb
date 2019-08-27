
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'


flags_file = File.read("./flags.json")
flags_hash = JSON.parse(flags_file) 


flags_hash.each do |fh|
  Country.create(
    name: fh["name"],
    language: fh["languages"],
    emoji: fh["emoji"]
  )
end

5.times do
  User.create(
    name: Faker::Name.name,
    age: rand(18...95),
    country_of_origin: Country.all.sample.name,
    profile_pic: Faker::Address.city,
    points: 10,
    password: "password"
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

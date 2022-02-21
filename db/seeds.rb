# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating colonies"

20.times do
  Colony.create{
    name: Faker::Fantasy::Tolkien.location
    description: Faker::Movies::StarWars.wookiee_sentence
    location: Faker::Movies::StarWars.planet
    population: Faker::Fantasy::Tolkien.race
    hostility:(1..100).to_a.sample
  }
  puts colony.name
end

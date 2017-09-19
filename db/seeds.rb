# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  Person.create(
    name: Faker::Name.last_name,
    given_name: Faker::Name.first_name,
    year_of_birth: Faker::Number.between(1650, 1800),
    year_of_death: Faker::Number.between(1800, 2017),
    comments: Faker::Lorem.sentence
  )
  Neighborhood.create(
    name: Faker::GameOfThrones.city,
    borough_id: Faker::Number.between(1, 5)
  )
end

counter = 1
Person.all.each do |person|
  person.neighborhood_ids << counter
  person.save
  counter += 1
end

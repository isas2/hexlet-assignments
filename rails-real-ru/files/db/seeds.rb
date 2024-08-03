# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |_i|

  make = Faker::Vehicle.make
  Vehicle.create!(
    manufacture: make,
    model: Faker::Vehicle.model(make_of_model: make),
    color: Faker::Vehicle.color,
    doors: Faker::Vehicle.doors,
    kilometrage: Faker::Vehicle.kilometrage,
    production_year: Date.new(Faker::Vehicle.year, 1, 1)
  )
end

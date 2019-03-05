# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Remove old data

200.times do
  # Faker is a ruby module. We access classes or other
  # modules inside of a module with ::. Here Date is a
  # class inside the Faker module .
  created_at = Faker::Date.backward(365 * 3)

  Idea.create(
    title: Faker::Hacker.say_something_smart,
    description: Faker::ChuckNorris.fact,
    created_at: created_at,
    updated_at: created_at,
  )
end
idea = Idea.all

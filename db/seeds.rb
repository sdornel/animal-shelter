Animal.destroy_all
Shelter.destroy_all
User.destroy_all
AdoptionProcess.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter1 = Shelter.create()
10.times {Animal.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, shelter_id: shelter1.id, bio: Faker::Creature::Dog.meme_phrase, age: rand(1..15))}


15.times {User.create(name: Faker::Name.name, address: Faker::Address.street_address, age: rand(20..90), has_animals: [true, false].sample, bio: Faker::Quotes::Shakespeare.as_you_like_it_quote, password_digest: BCrypt::Password.create("password"))}


5.times{AdoptionProcess.create(animal: Animal.all.sample, user: User.all.sample, status: ["approved", "declined", "pending"].sample, meeting_date: Faker::Date.forward(days: 14) )}


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create(name:    "Longmont Humane Society",
                           address: "9595 Nelson Road",
                           city:    "Longmont",
                           state:   "Colorado",
                           zip:     "80501")
shelter_2 = Shelter.create(name:    "Humane Society of Boulder Valley",
                           address: "2323 55th St",
                           city:    "Boulder",
                           state:   "Colorado",
                           zip:     "80301")
shelter_3 = Shelter.create(name:    "Adams County Animal Services",
                          address: "10705 Fulton St",
                          city:    "Brighton",
                          state:   "Colorado",
                          zip:     "80601")
shelter_4 = Shelter.create(name:    "Foothills Animal Shelter",
                          address: "580 McIntyre St",
                          city:    "Golden",
                          state:   "Colorado",
                          zip:     "80401")
shelter_5 = Shelter.create(name:    "Dumb Friends League",
                          address: "2080 S Quebec St",
                          city:    "Denver",
                          state:   "Colorado",
                          zip:     "80231")

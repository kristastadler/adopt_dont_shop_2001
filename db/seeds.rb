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

pet_1 = shelter_1.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT04wEEpUPJr9gf2QYqH5bFgQFRz62dfAigWbGMFBesaHYW7K06",
                              name: "Fluffy",
                              approximate_age: 3,
                              sex: "Female",
                              adoption_status: "Adoptable",
                              description: "Adorable cat ready to join your family")
pet_2 = shelter_1.pets.create(image: "https://s3.amazonaws.com/filestore.rescuegroups.org/6685/pictures/animals/12661/12661384/70682947_500x500.jpg",
                              name: "Titus",
                              approximate_age: 1,
                              sex: "Male",
                              adoption_status: "Pending Adoption",
                              description: "Full of energy and snuggles")
pet_3 = shelter_2.pets.create(image: "https://images-ra.adoptapet.com/images/Homepage-DogV2.png",
                              name: "Spot",
                              approximate_age: 4,
                              sex: "Male",
                              adoption_status: "Adoptable",
                              description: "Adorable ball of energy")
pet_4 = shelter_3.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS27BGeuhN9Ndqwqr_-qhZsGxUSnmE5yV2JO6gKxEltf5ECoZ_x",
                              name: "Sassy",
                              approximate_age: 7,
                              sex: "Female",
                              adoption_status: "Pending Adoption",
                              description: "This fancy lady loves pets and catnip")
pet_5 = shelter_4.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTH3_0S-yff9aTBXOnGbhfc44R0XPbb7J17xEMkOPZX-ONw4yJe",
                              name: "Albert",
                              approximate_age: 2,
                              sex: "Male",
                              adoption_status: "Adoptable",
                              description: "Albert loves going for long walks and getting belly rubs")
pet_6 = shelter_4.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIOnyTQLMTr4HlLhNGxcfBQgR7ZsR6yEqok73pledKJ40EXD2U",
                              name: "Lolita",
                              approximate_age: 6,
                              sex: "Female",
                              adoption_status: "Adoptable",
                              description: "Lolita loves adventures and flowers")                              

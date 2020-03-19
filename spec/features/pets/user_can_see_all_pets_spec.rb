require 'rails_helper'

RSpec.describe "when user visits the pet index page", type: :feature do
  it "can see each pet in the system and its details" do
    shelter_1 = Shelter.create(name:    "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city:    "Boulder",
                               state:   "Colorado",
                               zip:     "80301")
    pet_1 = Pet.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT04wEEpUPJr9gf2QYqH5bFgQFRz62dfAigWbGMFBesaHYW7K06",
                         name: "Fluffy",
                         approximate_age: 3,
                         sex: "Female")
    #                     shelter_id: shelter_1.id)
    pet_2 = Pet.create(image: "https://s3.amazonaws.com/filestore.rescuegroups.org/6685/pictures/animals/12661/12661384/70682947_500x500.jpg",
                         name: "Titus",
                         approximate_age: 1,
                         sex: "Male")
    #                     shelter_id: shelter_1.id)



    visit "/pets"

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
#    expect(page).to have_content(pet_1.shelter_id.name)
    expect(page).to have_css("img[src*='#{pet_2.image}']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
#    expect(page).to have_content(pet_2.shelter_id.name)
  end
end

require 'rails_helper'

RSpec.describe "when user visits a shelter pets page", type: :feature do
  it "can see each pet that can be adopted from that shelter" do
    shelter_1 = Shelter.create(name:    "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city:    "Boulder",
                               state:   "Colorado",
                               zip:     "80301")
    shelter_2 = Shelter.create(name:    "Longmont Animal Shelter",
                               address: "1879 Nelson Road",
                               city:    "Longmont",
                               state:   "Colorado",
                               zip:     "80503")

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
    pet_3 = shelter_2.pets.create(image: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",
                         name: "Joe",
                         approximate_age: 4,
                         sex: "Male",
                         adoption_status: "Pending Adoption",
                         description: "Full of energy and snuggles")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_css("img[src*='#{pet_2.image}']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).not_to have_css("img[src*='#{pet_3.image}']")
    expect(page).not_to have_content(pet_3.name)
    expect(page).not_to have_content(pet_3.approximate_age)

  end
end

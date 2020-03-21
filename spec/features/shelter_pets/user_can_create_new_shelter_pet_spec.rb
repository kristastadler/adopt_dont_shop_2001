require 'rails_helper'

RSpec.describe "when user visits a shelter pets page", type: :feature do
  it "can see each pet that can be adopted from that shelter" do
    shelter_1 = Shelter.create(name:    "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city:    "Boulder",
                               state:   "Colorado",
                               zip:     "80301")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    fill_in 'pet[image]', with: "https://i.chzbgr.com/full/9059638528/hADE94BC4/fluffy-thailand-cat-cat"
    fill_in 'pet[name]', with: "Mr. Fluffy Pants"
    fill_in 'pet[description]', with: "He can haz cheezburger"
    fill_in 'pet[approximate_age]', with: 2
    fill_in 'pet[sex]', with: "Male"
    click_button "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_css("img[src*='https://i.chzbgr.com/full/9059638528/hADE94BC4/fluffy-thailand-cat-cat']")
    expect(page).to have_content("Mr. Fluffy Pants")
    expect(page).to have_content(2)
    expect(page).to have_content("Male")
    expect(new_pet.shelter.name).to eq(shelter_1.name)

    expect(new_pet.adoption_status).to eq("Adoptable")
  end
end

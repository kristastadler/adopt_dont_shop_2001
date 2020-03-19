require 'rails_helper'

RSpec.describe "when user visits a shelter page", type: :feature do
  it "can see shelter details" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content("City: #{shelter_1.city}")
    expect(page).to have_content("State: #{shelter_1.state}")
    expect(page).to have_content("Zip Code: #{shelter_1.zip}")

    visit "/shelters/#{shelter_2.id}"

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content("Address: #{shelter_2.address}")
    expect(page).to have_content("City: #{shelter_2.city}")
    expect(page).to have_content("State: #{shelter_2.state}")
    expect(page).to have_content("Zip Code: #{shelter_2.zip}")
  end
end

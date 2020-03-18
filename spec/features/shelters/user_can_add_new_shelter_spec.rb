require 'rails_helper'

RSpec.describe "when user visits shelter index page", type: :feature do
  it "can see link to create new shelter" do

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

    visit "/shelters"

    expect(page).to have_link 'New Shelter', href: "/shelters/new"
  end
end

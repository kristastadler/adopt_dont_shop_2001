require 'rails_helper'

RSpec.describe "when user visits a shelter show page", type: :feature do
  it "can delete the shelter" do

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

    click_on 'Delete Shelter'



  end
end

require 'rails_helper'

RSpec.describe "when user visits a shelter show page", type: :feature do
  it "can update the shelter" do

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

    expect(page).to have_link 'Update Shelter', href: "/shelters/#{shelter_1.id}/edit"
    click_on 'Update Shelter'
    fill_in 'shelter[name]', with: "New Longmont Animal Shelter"
    fill_in 'shelter[address]', with: "123 New Address"
    fill_in 'shelter[city]', with: "Hygiene"
    fill_in 'shelter[state]', with: "New CO"
    fill_in 'shelter[zip]', with: "12345"
    click_on 'Submit'

end
end

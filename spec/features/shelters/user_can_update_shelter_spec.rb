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
    fill_in :name, with: "New Longmont Animal Shelter"
    fill_in :address, with: "123 New Address"
    fill_in :city, with: "Hygiene"
    fill_in :state, with: "New CO"
    fill_in :zip, with: "12345"
    click_on 'Submit'
    expect(page).to have_content("New Longmont Animal Shelter")
    expect(page).to have_content("123 New Address")
    expect(page).to have_content("Hygiene")
    expect(page).to have_content("New CO")
    expect(page).to have_content("12345")

end
end

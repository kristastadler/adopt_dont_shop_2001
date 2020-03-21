require 'rails_helper'

RSpec.describe "when user visits the shelter index page", type: :feature do
  it "can click links to edit and delete the shelters information" do
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

    visit "/shelters"

    expect(page).to have_link 'Edit Shelter', href: "/shelters/#{shelter_1.id}/edit"
    expect(page).to have_link 'Edit Shelter', href: "/shelters/#{shelter_2.id}/edit"
    expect(page).to have_link 'Edit Shelter', href: "/shelters/#{shelter_3.id}/edit"

    expect(page).to have_link 'Delete Shelter', href: "/shelters/#{shelter_1.id}"
    expect(page).to have_link 'Delete Shelter', href: "/shelters/#{shelter_2.id}"
    expect(page).to have_link 'Delete Shelter', href: "/shelters/#{shelter_3.id}"

    click_link "Delete Shelter", href: "/shelters/#{shelter_1.id}"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)

  end
end

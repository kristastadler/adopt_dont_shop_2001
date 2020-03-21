require 'rails_helper'

RSpec.describe "when user visits the pets index page", type: :feature do
  it "can click links to edit the pets information" do
    shelter_1 = Shelter.create(name:    "Longmont Humane Society",
                               address: "9595 Nelson Road",
                               city:    "Longmont",
                               state:   "Colorado",
                               zip:     "80501")
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
    visit "/pets"

    expect(page).to have_link 'Edit Pet', href: "/pets/#{pet_1.id}/edit"
    expect(page).to have_link 'Edit Pet', href: "/pets/#{pet_2.id}/edit"

    click_link "Edit Pet", href: "/pets/#{pet_1.id}/edit"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end
end 

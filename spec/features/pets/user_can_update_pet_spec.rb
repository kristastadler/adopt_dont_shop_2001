require 'rails_helper'

RSpec.describe "when user visits a pet show page", type: :feature do
  it "can update the pets information" do
    shelter_1 = Shelter.create(name:    "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city:    "Boulder",
                               state:   "Colorado",
                               zip:     "80301")
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

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link 'Update Pet', href: "/pets/#{pet_1.id}/edit"
    click_on 'Update Pet'
    fill_in 'pet[image]', with: "https://i.chzbgr.com/full/9059638528/hADE94BC4/fluffy-thailand-cat-cat"
    fill_in 'pet[name]', with: "Mr. Fluffy Pants"
    fill_in 'pet[description]', with: "He can haz cheezburger"
    fill_in 'pet[approximate_age]', with: 2
    fill_in 'pet[sex]', with: "Male"
    click_on 'Submit'
    expect(current_path).to eql("/pets/#{pet_1.id}")
    expect(page).to have_css("img[src*='https://i.chzbgr.com/full/9059638528/hADE94BC4/fluffy-thailand-cat-cat']")
    expect(page).to have_content("Mr. Fluffy Pants")
    expect(page).to have_content("He can haz cheezburger")
    expect(page).to have_content(2)
    expect(page).to have_content("Male")

  end
end

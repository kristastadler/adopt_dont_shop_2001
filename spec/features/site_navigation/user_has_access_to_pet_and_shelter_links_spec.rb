require 'rails_helper'

RSpec.describe "when user visits any page", type: :feature do
  it "can click the name of a shelter and be taken to that shelters show page" do
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

    pet_1 = shelter_1.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT04wEEpUPJr9gf2QYqH5bFgQFRz62dfAigWbGMFBesaHYW7K06",
                                  name: "Fluffy",
                                  approximate_age: 3,
                                  sex: "Female",
                                  adoption_status: "Adoptable",
                                  description: "Adorable cat ready to join your family")
    pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/filestore.rescuegroups.org/6685/pictures/animals/12661/12661384/70682947_500x500.jpg",
                                  name: "Titus",
                                  approximate_age: 1,
                                  sex: "Male",
                                  adoption_status: "Pending Adoption",
                                  description: "Full of energy and snuggles")

    visit '/pets'
    click_on 'Longmont Humane Society'
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit '/pets'
    click_on 'Humane Society of Boulder Valley'
    expect(current_path).to eq("/shelters/#{shelter_2.id}")

    visit "/shelters/#{shelter_1.id}/pets"
    click_on 'Longmont Humane Society'
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit "/shelters/#{shelter_1.id}"
    click_on 'Longmont Humane Society'
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit "/shelters"
    click_on 'Longmont Humane Society'
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    visit "/shelters"
    click_on 'Humane Society of Boulder Valley'
    expect(current_path).to eq("/shelters/#{shelter_2.id}")
  end
end

  RSpec.describe "when user visits any page", type: :feature do
    it "can click the name of a pet and be taken to that pets show page" do
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

    visit '/pets'
    click_on 'Fluffy'
    expect(current_path).to eq("/pets/#{pet_1.id}")

    visit '/pets'
    click_on 'Titus'
    expect(current_path).to eq("/pets/#{pet_2.id}")

    visit "/pets/#{pet_1.id}"
    expect(page).to have_link 'Fluffy', href: "/pets/#{pet_1.id}"

    visit "/pets/#{pet_2.id}"
    expect(page).to have_link 'Titus', href: "/pets/#{pet_2.id}"

    visit "/shelters/#{shelter_1.id}/pets"
    click_on 'Fluffy'
    expect(current_path).to eq("/pets/#{pet_1.id}")

    visit "/shelters/#{shelter_1.id}/pets"
    click_on 'Titus'
    expect(current_path).to eq("/pets/#{pet_2.id}")

end
end

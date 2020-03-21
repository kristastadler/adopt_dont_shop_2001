require 'rails_helper'

RSpec.describe "when user visits any page", type: :feature do
  it "can click links for the pet and shelter index pages at the top of the page" do

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

    visit '/shelters'

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit '/shelters/new'

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit "/shelters/#{shelter_1.id}/edit"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit '/pets'

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit "/pets/#{pet_1.id}"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

  visit "/pets/#{pet_1.id}/edit"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

    visit "/shelters/#{shelter_1.id}/pets/new"

    expect(page).to have_link 'Shelter Index', href: "/shelters/"
    expect(page).to have_link 'Pet Index', href: "/pets/"

  end
end

class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:shelter_id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create

    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create({
      image: params[:pet][:image],
      name: params[:pet][:name],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      adoption_status: "Adoptable",
      description: params[:pet][:description]
      })
    pet.save

    redirect_to "/shelters/#{shelter.id}/pets"
  end

end

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
      image: params[:image],
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      adoption_status: "Adoptable",
      description: params[:description]
      })

    redirect_to "/shelters/#{shelter.id}/pets"
  end

end

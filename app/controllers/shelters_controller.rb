class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new({
      name: 'name',
      address: 'address',
      city: 'city',
      state: 'state',
      zip: 'zip'
      })
      shelter.save

      redirect_to "/shelters"
  end

end

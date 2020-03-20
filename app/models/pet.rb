class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex, :description, :adoption_status
  belongs_to :shelter

end

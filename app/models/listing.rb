class Listing < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :property_type
  validates_presence_of :number_bedroom
  validates_presence_of :number_accommodate


  PROPERTY_TYPE = ["Apartment", "Loft", "Single Family", "Multi-Family",
    "Condo", "Townhouse", "Flat"]
end

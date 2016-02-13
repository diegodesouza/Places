class Listing < ActiveRecord::Base
  paginates_per 4
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploaders :photos, PhotoUploader

  validates :title, presence: true,
    length: { minimum: 5 }
  validates :description, presence: true,
    length: { minimum: 25 }
  validates :street,
            :city,
            :state,
            :zipcode,
            :property_type,
            :number_bedroom,
            :number_accommodate, presence: true


  PROPERTY_TYPE = ["Apartment", "Loft", "Single Family", "Multi-Family",
    "Condo", "Townhouse", "Flat"]

  def self.search(query)
    where("title ILIKE ? OR street ILIKE ? OR city ILIKE ? OR state ILIKE ? OR zipcode ILIKE ?
    OR property_type ILIKE ?", "%" + query + "%",
     "%" + query + "%", "%" + query + "%", "%" + query + "%", "%" + query + "%", "%" + query + "%")
  end
end

class Listing < ActiveRecord::Base
  paginates_per 4
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :place_photo, PlacePhotoUploader
  mount_uploader :image_one, ImageOneUploader
  mount_uploader :image_two, ImageOneUploader
  mount_uploader :image_three, ImageOneUploader
  mount_uploader :image_four, ImageOneUploader


  validates :title, presence: true,
    length: { minimum: 5, maximum: 50 }
  validates :description, presence: true,
    length: { minimum: 25, maximum: 400 }
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

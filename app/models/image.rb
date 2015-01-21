class Image < ActiveRecord::Base
  belongs_to :listing

  mount_uploader :image1, PlacePhotoUploader
  mount_uploader :image2, PlacePhotoUploader
  mount_uploader :image3, PlacePhotoUploader
  mount_uploader :image4, PlacePhotoUploader
  mount_uploader :image5, PlacePhotoUploader
end

class User < ActiveRecord::Base
  has_many :listings, dependent: :destroy
  has_many :reservations
  has_many :reviews

  mount_uploader :profile_photo, ProfilePhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

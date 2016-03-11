class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates :title,
    presence: true,
    length: { maximum: 50}
  validates :description,
    presence: true,
    length: { minimum: 25}
end

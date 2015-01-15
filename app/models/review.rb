class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates :title,
    presence: true
  validates :description,
    presence: true,
    length: { maximum: 25}
end

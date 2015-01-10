class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :check_in,
    presence: :true
  validates :check_out,
    presence: :true
end

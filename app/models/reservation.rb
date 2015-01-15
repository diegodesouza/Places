class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :check_in,
    presence: :true
  validates :check_out,
    presence: :true

  validate :available, on: :create

  def available

    there_is_a_booking = Reservation.where(listing_id: listing.id, check_in: check_in, check_out: check_out).exists?
    if there_is_a_booking
        errors.add(:listing, "Those dates are taken")
    # elsif
    #   check_in < check_out
    #     errors.add(:listing, "Check out date can't be lower than Check in date")
    # else
    #   return true
    end

  end
end

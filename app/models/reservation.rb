class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :check_in, :check_out, presence: :true
  validate :available, on: :create
  validate :check_out_cannot_be_less_than_check_in, on: :create

  def available
    there_is_a_booking = Reservation.where(listing_id: listing.id, check_in: check_in, check_out: check_out).exists?
    errors.add(:listing, "Those dates are taken") if there_is_a_booking
  end

  def check_out_cannot_be_less_than_check_in
    if check_in.nil?
      errors.add(:check_in, "Check in can't be blank")
    elsif check_out.nil?
      errors.add(:check_out, "Check out can't be blank")
    elsif check_out < check_in
      errors.add(:listing, "Check out date can't be lower than Check in date")
    end
  end
end

class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :check_in,
    presence: :true
  validates :check_out,
    presence: :true


  # validate :available, on: :create
  #
  # def available
  #   current_check_ins = []
  #   current_check_outs = []
  #
  #   Reservation.all.each do |r|
  #     current_check_ins << r.check_in
  #   end
  #
  #   Reservation.all.each do |r|
  #     current_check_outs << r.check_out
  #   end

    # if current_check_ins.include?(:check_in)
    #   errors.add(:check_in, "is not available") unless check_in.present?
    # end
    # named_scope :in_range, lambda { |range|
    #   {:conditions => [
    #     '(check_in BETWEEN ? AND ? OR check_out BETWEEN ? AND ?) OR (check_in <= ? AND check_out >= ?)',
    #     range.first, range.last, range.first, range.last, range.first, range.last
    #     ]}
    #   }
    # if check_in.present? && check_in < check_out
    #   errors.add(:check_in, "is not available")
    # end

  # end
end

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :tour

  validates :check_in, :check_out, :date, presence: true
  # status
end

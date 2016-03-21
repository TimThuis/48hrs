class Booking < ActiveRecord::Base
  belongs_to :guide, class_name: "User"
  belongs_to :visitor, class_name: "User"
  belongs_to :tour

  has_many :reviews, dependent: :destroy

  # validates :check_in, :check_out, :date, presence: true
  # status
end

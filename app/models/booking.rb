class Booking < ActiveRecord::Base
  attr_accessor :day

  belongs_to :guide, class_name: "User"
  belongs_to :visitor, class_name: "User"
  belongs_to :tour

  has_many :reviews, dependent: :destroy

  def hours
    ((check_out - check_in) / 60) / 60
  end

  # validates :check_in, :check_out, :date, presence: true
  # status
end

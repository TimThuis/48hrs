class Review < ActiveRecord::Base
  belongs_to :booking
  has_one :guide, through: :booking

  validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5
  validates :booking_id, presence: true
end

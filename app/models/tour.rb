class Tour < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :category, presence: true, inclusion: ["sport", "party", "food & drinks", "bar", "cultural"]
end

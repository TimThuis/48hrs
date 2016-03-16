class Tour < ActiveRecord::Base
  belongs_to :guide
  belongs_to :category
end

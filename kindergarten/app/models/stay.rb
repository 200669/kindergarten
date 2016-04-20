class Stay < ActiveRecord::Base
  belongs_to :child
  
  validates :child, presence: true
  validates :start, presence: true
end

class Stay < ActiveRecord::Base
  belongs_to :child
  has_many :meals, dependent: :destroy
  
  validates :child, presence: true
  validates :start, presence: true
end

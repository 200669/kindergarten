class Group < ActiveRecord::Base
  has_many :children
  
  validates :name,  presence: true, length: { maximum: 30 },
                     uniqueness: true
end

class Report < ActiveRecord::Base
  belongs_to :child
  belongs_to :user
  
  validates :period_begin, presence: true
  validates :period_end, presence: true
  validates :child, presence: true
end

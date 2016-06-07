class Setting < ActiveRecord::Base
  validates :free_stay_begin, presence: true
  validates :free_stay_end, presence: true
  validates :stay_price_per_hour, presence: true
end

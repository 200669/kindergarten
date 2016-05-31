class Meal < ActiveRecord::Base
  belongs_to :stay
  has_one :meal_type
end

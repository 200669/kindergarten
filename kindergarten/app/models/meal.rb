class Meal < ActiveRecord::Base
  belongs_to :stay
  belongs_to :meal_type
end

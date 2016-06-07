class MealType < ActiveRecord::Base
  validates :ordinal, presence: true, uniqueness: true
  validates :name,  presence: true, length: { maximum: 30 },
                     uniqueness: true
  validates :price,  presence: true
end

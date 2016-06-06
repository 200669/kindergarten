module MealsHelper
  
  def get_meal(stay, meal_type)
    if not stay.nil?
      stay.meals.each do |meal|
        return meal if meal.meal_type == meal_type
      end
    end
    
    return nil
  end
end

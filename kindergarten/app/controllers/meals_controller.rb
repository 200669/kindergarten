class MealsController < ApplicationController
  before_action :set_meal, only: [:destroy]

  # GET /meals
  # GET /meals.json
  def index
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @start_date = DateTime.new(@year, @month, @day)
    @end_date = @start_date.end_of_day
    
    @stays = Stay.where("start >= ? AND (end IS NULL OR end < ?)", @start_date, @end_date)
    @meal_types = MealType.all
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    if @meal.nil?
      @meal = Meal.new(meal_params)
    end
    
    if @meal.save
      render :json => { status: 'success' }
    else
      render :json => { status: 'error' , errors: @meal.errors }
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    render :json => { status: 'success' }
  end
  
  
  
  def calendar
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @stay = Stay.find(params[:stay_id])
      @meal_type = MealType.find(params[:meal_type_id])
      @meal = get_meal(@stay, @meal_type)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:stay_id, :meal_type_id)
    end
end

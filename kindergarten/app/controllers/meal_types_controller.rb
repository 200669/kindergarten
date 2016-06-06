class MealTypesController < ApplicationController
  before_action :check_logged_in
  before_action :set_meal_type, only: [:show, :edit, :update, :destroy]

  # GET /meal_types
  # GET /meal_types.json
  def index
    @meal_types = MealType.order(:ordinal)
  end

  # GET /meal_types/1
  # GET /meal_types/1.json
  def show
  end

  # GET /meal_types/new
  def new
    @meal_type = MealType.new
  end

  # GET /meal_types/1/edit
  def edit
  end

  # POST /meal_types
  # POST /meal_types.json
  def create
    @meal_type = MealType.new(meal_type_params)

    respond_to do |format|
      if @meal_type.save
        format.html { redirect_to @meal_type, flash: { info: 'Rodzaj posiłku pomyślnie dodany' } }
        format.json { render :show, status: :created, location: @meal_type }
      else
        format.html { render :new }
        format.json { render json: @meal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_types/1
  # PATCH/PUT /meal_types/1.json
  def update
    respond_to do |format|
      if @meal_type.update(meal_type_params)
        format.html { redirect_to @meal_type, flash: { info: 'Rodzaj posiłku zaktualizowany' } }
        format.json { render :show, status: :ok, location: @meal_type }
      else
        format.html { render :edit }
        format.json { render json: @meal_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_types/1
  # DELETE /meal_types/1.json
  def destroy
    @meal_type.destroy
    respond_to do |format|
      format.html { redirect_to meal_types_url, flash: { info: 'Rodzaj posiłku usunięty z bazy' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_type
      @meal_type = MealType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_type_params
      params.require(:meal_type).permit(:ordinal, :name, :price)
    end
end

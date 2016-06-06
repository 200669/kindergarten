class ReportsController < ApplicationController
  before_action :check_logged_in
  before_action :set_report, only: [:show, :details, :edit, :update, :destroy]
  
  def index
    @reports = Report.all
  end
  
  def show
    @meals = {}
    MealType.all.each do |type|
      @meals[type.id] = 0
    end
    @meals_fee = 0
    @hours_free = 0
    @hours_paid = 0
    
    @report.child.stays.where("start >= ? AND end < ?", @report.period_begin.beginning_of_day, @report.period_end.end_of_day).each do |stay|
      stay.meals.each do |meal|
        @meals[meal.meal_type.id] += 1
        @meals_fee += meal.meal_type.price
      end
      
      free_time_begin = get_settings.free_stay_begin.hour * 60 + get_settings.free_stay_begin.min
      free_time_end = get_settings.free_stay_end.hour * 60 + get_settings.free_stay_end.min
      
      stay_time_begin = stay.start.hour * 60 + stay.start.min
      stay_time_end = stay.end.hour * 60 + stay.end.min
      
      minutes_paid = 0
      
      if stay_time_begin < free_time_begin
        if stay_time_end < free_time_begin
          minutes_paid += stay_time_end - stay_time_begin
        else
          minutes_paid += free_time_begin - stay_time_begin
        end
      end
      
      if stay_time_end > free_time_end
        if stay_time_begin > free_time_end
          minutes_paid += stay_time_end - stay_time_begin
        else
          minutes_paid += stay_time_end - free_time_end
        end
      end
      
      @hours_paid += (minutes_paid / 60.0).ceil
      @hours_free += ((stay_time_end - stay_time_begin - minutes_paid) / 60.0).ceil
    end
    
    @hours_fee = @hours_paid * get_settings.stay_price_per_hour
  end
  
  def details
    show
  end
  
  def new
    @report = Report.new
  end
  
  def edit
  end
  
  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      flash[:info] = "Grupa dodana pomyślnie"
      redirect_to @report
    else
      render :new
    end
  end
  
  def update
    if @report.update(group_params)
      flash[:info] = "Dane grupy zapisane"
      redirect_to @report
    else
      render :edit
    end
  end
  
  def destroy
    @report.destroy
    flash[:info] = "Grupa usunięta"
    redirect_to reports_url
  end
  
  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:child_id, :period_begin, :period_end)
    end
end

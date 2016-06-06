class SettingsController < ApplicationController
  before_action :check_logged_in
  before_action :set_setting, only: [:index, :edit, :update]
  
  def index
  end
  
  def edit
  end
  
  def update
    if @setting.update(setting_params)
      flash[:info] = "Ustawienia zapisane"
      redirect_to settings_url
    else
      render :edit
    end
  end
  
  private
    def set_setting
      @setting = get_settings
    end

    def setting_params
      params.require(:setting).permit(:free_stay_begin, :free_stay_end, :stay_price_per_hour)
    end
end

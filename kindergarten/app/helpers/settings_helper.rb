module SettingsHelper
  
  def get_settings
    settings = Setting.first
    
    if settings.nil?
      settings = Setting.create!(default_settings)
    end
    
    return settings
  end
  
  def default_settings
    { free_stay_begin: Time.at(8 * 3600), free_stay_end: Time.at(13 * 3600), stay_price_per_hour: 1 }
  end
end

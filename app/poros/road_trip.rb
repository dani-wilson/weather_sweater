class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(roadtrip_data)
    @start_city = roadtrip_data[:start_city]
    @end_city = roadtrip_data[:end_city]
    @travel_time = roadtrip_data[:travel_time]
    @weather_at_eta = roadtrip_data[:future_weather]
  end


  # def format_travel_time(roadtrip_data)
  #   if roadtrip_data[:travel_time] == 'impossible'
  #     nil
  #   else
  #     roadtrip_data[:travel_time]
  #   end
  # end

  # def formatted_travel_time(roadtrip_data)
  #   if roadtrip_data == 'impossible'
  #     'impossible'
  #   else
  #     minutes = roadtrip_data.to_f / 60
  #     hours = (minutes / 60).to_i 
  #     fractal_hours = (minutes / 60).round(2).modulo(1)
  #     fractal_minutes = (fractal_hours * 60).round

  #     pleuralize_hours = 
  #     if hours == 1
  #       'hour'
  #     else
  #       'hours'
  #     end

  #     pleuralize_minutes = 
  #     if fractal_minutes == 1
  #       'minute'
  #     else
  #       'minutes'
  #     end

  #     "#{hours} #{pleuralize_hours}, #{fractal_minutes} #{pleuralize_minutes}"
  #   end
  # end
end
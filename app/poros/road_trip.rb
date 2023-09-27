class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(roadtrip_data)
    @start_city = roadtrip_data[:start_city]
    @end_city = roadtrip_data[:end_city]
    @travel_time = format_travel_time(roadtrip_data[:travel_time])
    @weather_at_eta = format_weather(roadtrip_data)
  end

  def format_travel_time(roadtrip_data)
    if roadtrip_data == "impossible"
      nil 
    else
      hours = (roadtrip_data.to_i / 3600).to_i
      minutes = ((roadtrip_data.to_i % 3600) / 60).to_i
      "#{hours} H #{minutes} m"
    end
  end

  def format_weather(roadtrip_data)
    if roadtrip_data[:travel_time] == "impossible"
      'impossible'
    else
      roadtrip_data[:weather_at_eta]
    end
  end
end
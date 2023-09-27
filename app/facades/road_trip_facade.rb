class RoadTripFacade
  class << self

    def road_trip(start_city, end_city)
      data = {
        start_city: start_city,
        end_city: end_city,
        travel_time: travel_time(start_city, end_city),
        weather_at_eta: future_weather(start_city, end_city)
      }
      RoadTrip.new(data)
    end

    def future_weather(start_city, end_city)
      time = travel_time(start_city, end_city).round
      unformatted_date = DateTime.now + time 
      eta = unformatted_date.strftime('%m/%d/%Y')
      weather = WeatherService.weather_by_eta(end_city, eta)
      RoadTripForecast.new(weather)
    end

    def travel_time(start_city, end_city)
      time = MapquestService.estimated_time(start_city, end_city)
      if time[:info][:messages] == [ "We are unable to route with the given locations" ]
        'impossible'
      else
        total_hours = ((time[:time][1]).round / 60) / 60
      end
    end
  end
end
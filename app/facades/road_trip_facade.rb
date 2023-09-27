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
      t_time = travel_time(start_city, end_city)
      if t_time != "impossible"
        hours = ((travel_time(start_city, end_city).to_i.round) / 60) / 60
        seconds = hours * 3600
        date = DateTime.now + Rational(seconds, 86400) + 14
        eta = date.strftime('%Y-%m-%d')
        response = WeatherService.weather_by_eta(end_city, eta)
        parsed = JSON.parse(response.body, symbolize_names: true)
        data = {
          datetime: parsed[:location][:localtime],
          temperature: parsed[:forecast][:forecastday][0][:day][:maxtemp_f],
          conditions: parsed[:forecast][:forecastday][0][:day][:condition][:text]
        }
        RoadTrip.new(data)
      else 
        return 'impossible'
      end
    end

    def future_date(start_city, end_city)
      time = travel_time(start_city, end_city)
      unformatted_date = DateTime.now + time
      eta = unformatted_date.strftime('%m/%d/%Y %H%M')
    end

    def travel_time(start_city, end_city)
      time = MapquestService.estimated_time(start_city, end_city)
      if time[:info][:messages] == [ "No routes found." ]
        return 'impossible'
      else
        total_hours = time[:time][1].round
      end
    end
  end
end
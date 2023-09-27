class RoadTripForecast
  attr_reader :temperature,
              :conditions

  def initialize(params)
    @temperature = params[:temperature].to_f
    @conditions = params[:conditions]
  end
end
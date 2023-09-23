class MapquestService
  def conn
    Faraday.new(url: "https://www.mapquestapi.com" do |f|
      require 'pry'; binding.pry
      f.params[:key] = Rails.application.credentials['MAPQUEST_CONSUMER_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
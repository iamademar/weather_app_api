class WeatherController < ApplicationController
  include HTTParty
  default_timeout 5

  def show
    city = params[:city]
    begin
      weather_data = fetch_weather_data(city)
      render json: weather_data
    rescue Net::OpenTimeout, Net::ReadTimeout
      render json: { error: "The request to the weather service timed out." }, status: :request_timeout
    rescue HTTParty::Error => e
      render json: { error: "There was a problem fetching the weather data." }, status: :bad_gateway
    end
  end

  private

    def fetch_weather_data(city)
      api_key = ENV['OPEN_WEATHER_MAP_API_KEY']
      url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
      self.class.get(url)
    end
end

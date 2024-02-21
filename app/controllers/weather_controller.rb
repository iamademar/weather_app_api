class WeatherController < ApplicationController
  before_action :authenticate_user!
  def show
    city = params[:city]
    weather_data = WeatherFetcher.fetch(city: city)

    if weather_data.key?(:error)
      render json: weather_data, status: (weather_data[:error].include?('timed out') ? :request_timeout : :bad_gateway)
    else
      render json: weather_data
    end
  end
end

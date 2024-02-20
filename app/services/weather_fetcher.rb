class WeatherFetcher
  include HTTParty
  base_uri "api.openweathermap.org"
  default_timeout 5

  def self.fetch(city:)
    WeatherApiAppTracer.in_span("openweather_api_request") do |span|
      new.fetch(city: city)
    end
  end

  def fetch(city:)
    span = OpenTelemetry::Trace.current_span
    span.add_event("Start API request to OpenWeatherMap API")
    result = self.class.get("/data/2.5/weather", query: { q: city, appid: api_key, units: "metric" })
    span = OpenTelemetry::Trace.current_span
    span.add_event("End of API request to OpenWeatherMap API")
    result
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    { error: "The request to the weather service timed out." }
  rescue HTTParty::Error => e
    { error: "There was a problem fetching the weather data." }
  end

  private

    def api_key
      ENV["OPEN_WEATHER_MAP_API_KEY"]
    end
end

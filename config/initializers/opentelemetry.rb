require "opentelemetry/sdk"
require "opentelemetry/exporter/otlp"
require "opentelemetry/instrumentation/all"

OpenTelemetry::SDK.configure do |c|
  c.service_name = "weather-api-app"
  c.use_all()
end

WeatherApiAppTracer = OpenTelemetry.tracer_provider.tracer("weather-api-app-tracer")

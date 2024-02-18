require "opentelemetry/sdk"
require "opentelemetry/exporter/otlp"
require "opentelemetry/instrumentation/all"
require "opentelemetry/instrumentation/http"

OpenTelemetry::SDK.configure do |c|
  c.service_name = "weather-api-app"
  c.use_all()
end

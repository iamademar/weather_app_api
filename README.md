# README



## Weather Data API Documentation

The Weather Data API provides access to real-time weather information for cities around the world. It utilizes data from OpenWeatherMap, the API returns current [weather information](https://openweathermap.org/current#example_JSON).


## Versions
- [V2](https://github.com/iamademar/weather_app_api/releases/tag/v2.0)
- [V1](https://github.com/iamademar/weather_app_api/releases/tag/v1.0)


### Base URL
The base URL for the API is: 
https://localhost:3000/

### Authentication
This API does not require authentication for access.

### Endpoints
Get Weather Data for a City
Retrieves the current weather data for a specified city.

- HTTP Method: GET
- Endpoint: /weather
- Query Parameters:
- city: Name of the city (required)
- Response: JSON object containing weather data

Request Example:
```
curl "http://localhost:3000/weather/show?city=Colombo"
```

Or you can request via Postman
<img width="736" alt="Screenshot 2024-02-21 at 9 59 06 AM" src="https://github.com/iamademar/weather_app_api/assets/237025/43da4b33-8fb8-427a-8e93-75d036adb851">

### Error Handling
The API uses standard HTTP status codes to indicate the success or failure of requests:
- 200 OK: The request was successful.
- 400 Nothing to Geocode: The request was invalid. This usually occurs due to missing or incorrect query parameters.

### Rate Limiting
The API does not currently enforce rate limiting. However, excessive use may lead to temporary restrictions. Please use the API responsibly.
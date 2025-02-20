# GeoWeatherFeature Feature Documentation
## overview/
    this feature manages fetching  current and forecast weather based on the user's location

## Architecture (CLEAN ARCH and Follows MVVM Pattern)/
## core
### network
 `/api_service.dart`
    ApiService class using DIO package to make a API requests  for 
    retrieving  weather data
### location
 `/get_location.dart`
    GetLocation class using Location package to determine user's location 
## Lib
###  /Data Layer 
### Manages Authentication Data
 `RemoteDataSource` → Handles retrieving weather data from the Weather API
 `RemoteRepositoryImpl` → Implements `WeatherRepository`.

###  /Domain Layer
### Contains BusinessLogic 
 `WeatherRepository` => Abstract Repositry Interface
 `GetWeatherCase` → Handles retrieving weather data from the Weather API

### /Presentation Layer**
### Handels UI , STateManagement
- `WeatherCubit` → Manages getting Weather state.
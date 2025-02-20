import 'package:ai_weather/features/home/data/models/forecast_weather_model.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';

class WeatherModel {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  final String location;
  final List<ForecastWeatherModel> forecast;
  // final String? date;
  // final double? averageTemp;
  // final int? averageHumidity;
  // final String? dayCondition;
  // final double? dayUv;
  // final int? dayRain;
  WeatherModel({
    required this.forecast,
    required this.location,
    required this.uv,
    required this.condition,
    required this.temp,
    required this.humidity,
    required this.rain,
    // this.date,
    // this.averageTemp,
    // this.averageHumidity,
    // this.dayCondition,
    // this.dayUv,
    // this.dayRain
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WeatherModel(
          temp: json['current']['temp_c'].toDouble(),
          humidity: json['current']['humidity'],
          condition: json['current']['condition']['text'],
          uv: json['current']['uv'],
          rain: json['current']['precip_mm'],
          location: json['location']['region'],
          forecast: (json['forecast']['forecastday'] as List)
              .map((day) => ForecastWeatherModel.fromJson(day))
              .toList()

          // averageTemp: json['forecast']['forecastday'][index]['day']['avgtemp_c']
          //     .toDouble(),
          // averageHumidity: json['forecast']['forecastday'][index]['day']
          //     ['avghumidity'],
          // dayCondition: json['forecast']['forecastday'][index]['condition'],
          // dayUv: json['forecast']['forecastday'][index]['day']['uv'],
          // dayRain: json['forecast']['forecastday'][index]['day']
          //     ['daily_chance_of_rain'],
          // date: json['forecast']['forecastday'][index]['date'],
          );

  WeatherEntity toEntity() {
    return WeatherEntity(
        forecast: forecast.map((e) => e.toEntity()).toList(),
        rain: rain,
        temp: temp,
        humidity: humidity,
        condition: condition,
        uv: uv,
        location: location);
  }
}

import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class WeatherEntity {
  final double temp;
  final int humidity;
  final String condition;
  final double uv;
  final double rain;
  final String location;
  final List<ForecastEntity> forecast;

  WeatherEntity(
      {required this.forecast,
      required this.location,
      required this.rain,
      required this.uv,
      required this.condition,
      required this.temp,
      required this.humidity});
}

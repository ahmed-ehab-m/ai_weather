import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';

class ForecastWeatherModel {
  final String date;
  final double averageTemp;
  final int averageHumidity;
  final String condition;
  final double uv;
  final int rainChance;

  ForecastWeatherModel(
      {required this.date,
      required this.averageTemp,
      required this.averageHumidity,
      required this.condition,
      required this.uv,
      required this.rainChance});

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        averageTemp: json['day']['avgtemp_c'].toDouble(),
        averageHumidity: json['day']['avghumidity'],
        condition: json['day']['condition']['text'],
        uv: json['day']['uv'],
        rainChance: json['day']['daily_chance_of_rain'],
        date: json['date'],
      );

  ForecastEntity toEntity() {
    return ForecastEntity(
        rainChance: rainChance.toDouble(),
        condition: condition,
        uv: uv,
        date: date,
        day: date,
        averageTemp: averageTemp,
        averageHumidity: averageHumidity);
  }
}

import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class GetWeatherUseCase {
  Future<Either<Failure, WeatherEntity>> call({required String location});
}

class GetWeatherUseCaseImpl implements GetWeatherUseCase {
  final WeatherRepositry weatherRepositry;
  GetWeatherUseCaseImpl(this.weatherRepositry);
  @override
  Future<Either<Failure, WeatherEntity>> call({required String location}) {
    return weatherRepositry.getWeather(location: location);
  }
}

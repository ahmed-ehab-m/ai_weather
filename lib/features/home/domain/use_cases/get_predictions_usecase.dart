import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/home/domain/repo_interface/weather_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class GetPredictionUseCase {
  Future<Either<Failure, Map<String, dynamic>>> call(
      {required List<int> features});
}

class GetPredictionUseCaseImpl implements GetPredictionUseCase {
  final WeatherRepositry weatherRepositry;
  GetPredictionUseCaseImpl(this.weatherRepositry);
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      {required List<int> features}) {
    return weatherRepositry.getPredictions(features: features);
  }
}

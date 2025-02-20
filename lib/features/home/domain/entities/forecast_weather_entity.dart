import 'package:flutter/material.dart';

class ForecastEntity {
  final String day;
  final double averageTemp;
  final int averageHumidity;
  final double uv;
  final double rainChance;
  final String condition;
  Color? color;

  ForecastEntity({
    this.color,
    required this.day,
    required this.averageTemp,
    required this.averageHumidity,
    required this.uv,
    required this.rainChance,
    required this.condition,
    required String date,
  });
}

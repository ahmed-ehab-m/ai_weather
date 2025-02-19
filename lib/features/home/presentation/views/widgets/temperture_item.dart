import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TempertureItem extends StatelessWidget {
  const TempertureItem({
    super.key,
    required this.temp,
    required this.type,
    required this.color,
  });
  final String temp;
  final String type;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          temp,
          style: AppTextStyles.textStyle48.copyWith(color: color),
        ),
        Text(
          type,
          style: AppTextStyles.textStyle22.copyWith(color: color),
        ),
      ],
    );
  }
}

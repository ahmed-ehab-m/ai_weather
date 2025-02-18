import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TempertureItem extends StatelessWidget {
  const TempertureItem({super.key, required this.temp, required this.type});
  final String temp;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(temp, style: AppTextStyles.textStyle38.copyWith(fontSize: 48)),
        Text(type, style: AppTextStyles.textStyle18),
      ],
    );
  }
}

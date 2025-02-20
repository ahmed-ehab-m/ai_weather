import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
    required this.location,
    required this.userName,
  });
  final String userName;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.hello,
                style: AppTextStyles.textStyle38.copyWith(
                  color: Colors.white.withAlpha(150),
                )),
            const Spacer(),
            Text(location,
                style: AppTextStyles.textStyle22.copyWith(
                  color: Colors.white.withAlpha(150),
                )),
          ],
        ),
        Text(
          userName,
          style: AppTextStyles.textStyle22.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.white.withAlpha(150),
          ),
        )
      ],
    );
  }
}

import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key, required this.onPressed, required this.buttonName});
  final void Function() onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(buttonName, style: AppStyles.textStyle22),
    );
  }
}

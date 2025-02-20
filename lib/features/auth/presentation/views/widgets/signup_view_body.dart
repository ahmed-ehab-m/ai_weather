import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/helper/functions/custom_snack_bar.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/core/styles/text_styles.dart';
import 'package:ai_weather/core/utils/validation.dart';
import 'package:ai_weather/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/account_check_row.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ai_weather/features/auth/presentation/views/widgets/submit_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final formkey = GlobalKey<FormState>();
  Widget buttonChild = const Text(AppStrings.signUp);
  String email = '';
  String password = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSizeHelper.authVerticalPadding,
            horizontal: screenSizeHelper.horizontalPadding),
        child: Form(
          key: formkey,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignUpLoading) {
                buttonChild = const CircularProgressIndicator(
                  color: Colors.white,
                );
              }
              if (state is SignUpFailure) {
                buttonChild = const Text(AppStrings.signUp);
                showSnackBar(context,
                    message: state.message, color: Colors.red);
              }
              if (state is SignUpSuccess) {
                buttonChild = const Text(AppStrings.signUp);
                showSnackBar(context,
                    message: AppStrings.signUpSuccess, color: Colors.green);
                GoRouter.of(context).push(AppRouter.login);
              }
            },
            builder: (context, state) {
              return Column(
                spacing: screenSizeHelper.screenHeight * 0.03,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      AppStrings.signUp,
                      style: AppTextStyles.textStyle38
                          .copyWith(color: kPrimaryColor),
                    ),
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: AppStrings.hintName,
                    validator: (value) {
                      return FormValidation.validateName(value!);
                    },
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: AppStrings.hintEmail,
                    validator: (value) {
                      return FormValidation.validateEmail(value!);
                    },
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      password = value!;
                    },
                    validator: (value) {
                      return FormValidation.validatePassword(value!);
                    },
                    hintText: AppStrings.hintPassword,
                    obscureText: BlocProvider.of<AuthCubit>(context).isVisible,
                    suffixIcon: IconButton(
                      onPressed:
                          BlocProvider.of<AuthCubit>(context).togglePassword,
                      icon: Icon(
                        BlocProvider.of<AuthCubit>(context).suffixIcon,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SubmitButton(
                      onPressed: () {
                        formkey.currentState!.save();
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .signUp(email, password, name);
                        }
                      },
                      buttonChild: buttonChild),
                  AccountCheckRow(
                    type: AppStrings.login,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.login);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

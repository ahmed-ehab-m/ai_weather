import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather/features/auth/domain/usecases/login_usecase.dart';
import 'package:ai_weather/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUsecase, this.signUpUseCase) : super(AuthInitial());
  final LoginUsecase loginUsecase;
  final SignUpUseCase signUpUseCase;
  Future<void> signUp(String email, String password, String name) async {
    emit(SignUpLoading());
    final result = await signUpUseCase.execute(email, password, name);
    result.fold(
      (failure) => emit(
        SignUpFailure(message: failure.message),
      ),
      (user) => emit(
        SignUpSuccess(userEntity: user),
      ),
    );
  }

  Future<void> logIn(String email, String password) async {
    emit(LoginLoading());
    final result = await loginUsecase.execute(email, password);
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (user) => emit(
        LoginSuccess(userEntity: user),
      ),
    );
  }

////////////Method for password visibility////////////////////////////
  bool isVisible = true;
  IconData suffixIcon = Icons.visibility_off;
  void togglePassword() {
    isVisible = !isVisible;
    suffixIcon = isVisible ? Icons.visibility_off : Icons.visibility;
    emit(TogglePassword());
  }
}

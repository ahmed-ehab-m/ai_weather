import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUsecase {
  Future<Either<Failure, UserEntity>> execute(String email, String password);
}

class LoginUsecaseImpl implements LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecaseImpl(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return authRepository.logIn(email, password);
  }
}

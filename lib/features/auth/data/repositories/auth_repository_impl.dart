import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/error/failure.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_remote_datasource.dart';
import 'package:ai_weather/features/auth/domain/entities/userEntity.dart';
import 'package:ai_weather/features/auth/domain/repo_interface/auth_repositry.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepositry {
  final AuthRemoteDatasource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> logIn(
      String email, String password) async {
    try {
      final userModel = await authRemoteDataSource.logIn(email, password);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error"));
    }
  }

  Future<Either<Failure, UserEntity>> signUp(
      String email, String password) async {
    try {
      final userModel = await authRemoteDataSource.signUp(email, password);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error"));
    }
  }
}

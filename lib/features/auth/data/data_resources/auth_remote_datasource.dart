import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  // final AuthLocalDataSourceImpl authLocalDataSource;
  final CacheHelper prefsHelper;
  AuthRemoteDatasource(
    this.firebaseAuth,
    // this.authLocalDataSource,
    this.prefsHelper,
  );
  Future<UserModel?> signUp(String email, String password, String name) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(id: result.user!.uid, email: email, name: name);
      await prefsHelper.cacheUserData(user: user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.weakPassword) {
        throw ServerException(AppStrings.weakPassword);
      }
      if (e.code == AppStrings.emailAlreadyInUse) {
        throw ServerException(AppStrings.emailAlreadyInUse);
      } else {
        throw ServerException(e.toString());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<UserModel?> logIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = prefsHelper.getUserData();
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.userNotFound) {
        throw ServerException(AppStrings.userNotFound);
      }
      if (e.code == AppStrings.wrongPassword) {
        throw ServerException(AppStrings.wrongPassword);
      } else {
        throw ServerException(e.toString());
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences prefs;
  CacheHelper(this.prefs);

  Future<void> cacheUserData({required UserModel user}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kUserId, user.id);
      await prefs.setString(kUserName, user.name);
    } on Exception catch (e) {
      throw CacheException(e.toString());
    }
  }

  Future<UserModel?>? getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final uid = prefs.getString(kUserId);
      final name = prefs.getString(kUserName);
      if (uid != null && name != null) {
        return UserModel(id: uid, email: '', name: name);
      }
      return null;
    } on Exception catch (e) {
      throw CacheException(e.toString());
    }
  }
}

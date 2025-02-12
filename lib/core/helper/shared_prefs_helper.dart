import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  final SharedPreferences prefs;
  SharedPrefsHelper(this.prefs);
  @override
  Future<void> cacheUserData({required UserModel user}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', user.id);
    await prefs.setString('name', user.name);
  }

  @override
  Future<UserModel?>? getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final name = prefs.getString('name');
    if (uid != null && name != null) {
      return UserModel(id: uid, email: '', name: name);
    }
    return null;
  }
}

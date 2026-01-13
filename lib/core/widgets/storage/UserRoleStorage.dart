import 'package:digiations_nexa/core/widgets/constants/user_role.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRoleStorage {
  static const _key = 'user_role';

  static Future<void> saveRole(UserRole role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, role.name);
  }

  static Future<UserRole?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString(_key);

    if (role == null) return null;
    return UserRole.values.firstWhere((e) => e.name == role);
  }

  static Future<void> clearRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

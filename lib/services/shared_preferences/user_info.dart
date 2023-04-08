import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userInfo', jsonEncode(userInfo));
}

Future<Map<String, dynamic>?> getUserInfo() async {
  final prefs = await SharedPreferences.getInstance();
  final userInfoString = prefs.getString('userInfo');
  if (userInfoString != null) {
    return jsonDecode(userInfoString);
  }
  return null;
}

Future<Map<String, dynamic>?> mapperJson(
    int id, String externalUserId, name, email) async {
  //どれか入っていれば一旦ok
  if (externalUserId != "" || name != "" || email != "") {
    final userInfo = {
      'id': id,
      'external_user_id': externalUserId,
      'name': name,
      'email': email
    };
    return userInfo;
  }
  return null;
}

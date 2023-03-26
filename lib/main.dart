import 'package:flutter/material.dart';
import 'package:flutter_matching_app/services/googlelogin/login_is_active.dart';
import 'app.dart';
import 'login.dart';

void main() {
  // Flutterフレームワークが初期化され、バインディングが設定され、後続のFlutterコードでバインディングを使用できる
  WidgetsFlutterBinding.ensureInitialized();
  runAppWithUserLogin();
}

void runAppWithUserLogin() async {
  bool isLoggedIn = await isGoogleUserSignedIn();
  runApp(isLoggedIn ? const MyApp() : const MyLoginApp());
}

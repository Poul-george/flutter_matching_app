import 'package:flutter_matching_app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_matching_app/services/googlelogin/final_googlesignin.dart';

Future<void> googleSignOut() async {
  void _handleSignOut() async {
    // ログアウト処理
    await googleSignIn.signOut();
    print(googleSignIn);
  }

  _handleSignOut();
}

Future<void> completeLogout(BuildContext context) async {
  googleSignOut();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyLoginApp()),
  );
}

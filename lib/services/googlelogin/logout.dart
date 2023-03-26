import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/main.dart';

Future<void> googleSignOut() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void _handleSignOut() async {
    await _googleSignIn.signOut();
    // ここで、ログアウト後の処理を実行することができます。
    print(_googleSignIn);
  }

  _handleSignOut();
}

import 'package:google_sign_in/google_sign_in.dart';

// googleSignInは何度も再定義したくないのでここを経由してgoogleSignInオブジェクトは使用する
final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile'],
);

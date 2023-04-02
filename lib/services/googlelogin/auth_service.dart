import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/component/signin/google_sign_in_bottom.dart';
import 'package:flutter/services.dart';
import 'package:flutter_matching_app/app.dart';
import 'package:flutter_matching_app/services/googlelogin/final_googlesignin.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _completeLogin() {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MyApp(),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // ログイン後topページに遷移
        _completeLogin();
        print(googleSignInAccount);
      }
      return;
    } on PlatformException catch (e) {
      if (e.code == 'sign_in_canceled') {
        // Googleログインがキャンセルされた場合の処理
        print("google login is canceled");
      } else {
        // その他のPlatformExceptionが発生した場合の処理
        print("google login is not canceled");
      }
    } catch (error) {
      // Handle sign-in error
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleSignInButton(
          onPressed: _signInWithGoogle,
          text: 'Sign in with Google',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/component/signin/google_sign_in_bottom.dart';
import 'package:flutter/services.dart';
import 'package:flutter_matching_app/app.dart';
import 'package:flutter_matching_app/services/googlelogin/final_googlesignin.dart';
import 'package:flutter_matching_app/services/app/api/v1/user_api.dart';
import 'package:flutter_matching_app/model/user.dart';
import 'package:flutter_matching_app/services/shared_preferences/user_info.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // googleログイン後topページに飛ぶ処理
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
        if (googleSignInAccount.id == "") {
          print("googleSignInAccount.id is not found");
          return;
        }
        // googleログイン後、userテーブルにログインユーザーが作成されているか判定する。なかった場合は新規作成
        User? user = await fetchUsers(externalUserID: googleSignInAccount.id);
        print("${user?.externalUserID}first");
        if (user == null) {
          final bool flag = await postUser(googleSignInAccount);
          if (!flag) {
            print("user record not create");
            return;
          }
        }
        user = await fetchUsers(externalUserID: googleSignInAccount.id);
        print("${user?.externalUserID}2time");
        if (user == null) {
          print("user is record not found");
          return;
        }
        final Map<String, dynamic>? userJson = await mapperJson(
          user.id,
          user.externalUserID,
          user.name,
          user.mailAddress,
        );
        print("${userJson}session");
        if (userJson != null) {
          saveUserInfo(userJson);
        }

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

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/component/signin/google_sign_in_bottom.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // Google sign-in succeeded, now authenticate with Firebase
        // using the `googleSignInAccount.authentication` object.
        print(googleSignInAccount);
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

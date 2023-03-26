import 'package:google_sign_in/google_sign_in.dart';

Future<bool> isGoogleUserSignedIn() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  return await googleSignIn.isSignedIn();
}

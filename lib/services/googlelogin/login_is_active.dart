import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/services/googlelogin/final_googlesignin.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// ログイン済みかどうかの判定結果を返す
Future<bool> isGoogleUserSignedIn() async {
  return await googleSignIn.isSignedIn();
}

// ログインユーザーの情報を返却する,ログインユーザー情報が取得できない場合はログアウトさせる
Future<GoogleSignInAccount?> isGoogleLoginUser(BuildContext context) async {
  bool isLoggedIn = await isGoogleUserSignedIn();
  if (!isLoggedIn) {
    return null;
  }

  // TODO: ログインユーザーの取得時は、新規ログイン時に作成したユーザー情報を永続的に使用する形を取る
  // または、リアルタイムでgoogleUserを取得できるやり方があればそちらも並行して確認する
  GoogleSignInAccount? currentUser = googleSignIn.currentUser;
  if (currentUser == null) {
    print("google login user null");

    final completer = Completer<GoogleSignInAccount?>();

    StreamSubscription<GoogleSignInAccount?>? subscription;
    subscription = googleSignIn.onCurrentUserChanged.listen((account) {
      completer.complete(account);
      subscription?.cancel();
    });

    currentUser = await completer.future;
  }
  print("google login できてるよ");
  return currentUser;
}

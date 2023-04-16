import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_matching_app/model/user.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/config/config.dart';
import 'package:flutter_matching_app/component/errordaialog/net_ettor.dart';

Future<User?> fetchUsers(
    {String externalUserID = "",
    int userID = 0,
    required BuildContext context}) async {
  Config config = await getConfig();

  // http.get処理内でfinal userを定義したものを返却してもnullになるため、こここで先に定義しておく
  User? user;

  String data = "?";
  if (externalUserID != "") {
    data = data + "external_user_id=$externalUserID";
  }
  if (userID != 0) {
    data = data + "&user_id=$userID";
  }
  print(data);

  await http.get(
    Uri.parse(
      '${config.apiHost}/api/v1/users/detail$data',
    ),
    // goのcorsでoriginを見てリクエストを受け付けているのでheaderにoriginで許可されているoriginを指定する
    headers: {'Origin': config.origin},
  ).then((response) {
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as Map<String, dynamic>;
      user = User.fromJson(jsonList);
      return user;
    }
  }).catchError((error) {
    // HTTPリクエストが失敗した場合の処理
    print("-----------------------");
    showErrorDialog(context, error.toString(), error.hashCode);
    return user;
  });
  return user;
}

Future<bool> postUser(
    GoogleSignInAccount userAccount, BuildContext context) async {
  Config config = await getConfig();
  bool flag = false;
  print(userAccount.email);
  print(userAccount.id);

  final data = {
    'external_user_id': userAccount.id,
    'name': userAccount.displayName,
    'email': userAccount.email,
  };

  await http
      .post(
    Uri.parse('${config.apiHost}/api/v1/users'),
    headers: {
      'Origin': config.origin,
      'Content-Type': 'application/json',
    },
    body: json.encode(data),
  )
      .then((response) {
    if (response.statusCode == 200) {
      print('User created: ${response.body}');
      return flag = true;
    }
  }).catchError((error) {
    // HTTPリクエストが失敗した場合の処理
    print("-----------------------");
    showErrorDialog(context, error.toString(), error.hashCode);
    return flag = false;
  });

  return flag;
}

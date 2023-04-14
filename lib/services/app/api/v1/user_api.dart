import 'package:http/http.dart' as http;
import 'package:flutter_matching_app/model/user.dart';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_matching_app/config/config.dart';

Future<User?> fetchUsers({String externalUserID = "", int userID = 0}) async {
  Config config = await getConfig();

  print(externalUserID);
  String data = "?";
  if (externalUserID != "") {
    data = data + "external_user_id=$externalUserID";
  }
  if (userID != 0) {
    data = data + "&user_id=$userID";
  }

  final response = await http.get(
    Uri.parse(
      // localhostなどでも良いがandroidの場合、/10.0.2.2出ないとダメそう
      '${config.apiHost}/api/v1/users/detail$data',
    ),
    // goのcorsでoriginを見てリクエストを受け付けているのでheaderにoriginで許可されているoriginを指定する
    headers: {'Origin': config.origin},
  );

  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(jsonList);
    return user;
  } else {
    print("-----------------------");
    print(response.statusCode);
    print(response.body);
    return null;
  }
}

Future<bool> postUser(GoogleSignInAccount userAccount) async {
  Config config = await getConfig();
  print(userAccount);
  print(userAccount.id);

  final data = {
    'external_user_id': userAccount.id,
    'name': userAccount.displayName,
    'email': userAccount.email,
  };

  final url = Uri.parse('${config.apiHost}/api/v1/users');
  final response = await http.post(
    url,
    headers: {
      'Origin': config.origin,
      'Content-Type': 'application/json',
    },
    body: json.encode(data),
  );

  final responseBody = json.decode(response.body);
  if (response.statusCode == 200) {
    print('User created: ${responseBody}');
    return true;
  } else {
    print('User create error: $responseBody');
    print('User create error code: ${response.statusCode}');
    return false;
  }
}

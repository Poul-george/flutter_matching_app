import 'package:http/http.dart' as http;
import 'package:flutter_matching_app/model/user.dart';
import 'dart:convert';

Future<List<User>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('http://localhost:1324/api/v1/users'),
    // goのcorsでoriginを見てリクエストを受け付けているのでheaderにoriginで許可されているoriginを指定する
    headers: {'Origin': 'http://127.0.0.1:5555'},
  );

  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body) as List<dynamic>;
    return jsonList.map((e) => User.fromJson(e)).toList();
  } else {
    print("-----------------------");
    print(response.statusCode);
    print(response.body);
    return [];
  }
}

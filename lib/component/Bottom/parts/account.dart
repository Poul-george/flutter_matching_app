import 'package:flutter/material.dart';
import 'package:flutter_matching_app/services/googlelogin/login_is_active.dart';
import 'package:flutter_matching_app/model/user.dart';
import 'package:flutter_matching_app/services/app/api/v1/user_api.dart';

class AccountScreen extends StatefulWidget {
// class UsersScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<AccountScreen> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers().then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("-----------------------");
    print(isGoogleLoginUser(context));
    print("-----------------------");
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('mail: ${user.mailAddress}'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_matching_app/model/user.dart';
import 'package:flutter_matching_app/services/app/api/v1/user_api.dart';
import 'package:flutter_matching_app/services/shared_preferences/user_info.dart';

class AccountScreen extends StatefulWidget {
// class UsersScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<AccountScreen> {
  User? _user;
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    super.initState();
    getUserInfo().then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        userInfo = value; // nullチェックしてデフォルト値を設定する
      });
      // sessionに保存が確認できたら、その情報をもにdbからデータを取ってくる
      if (userInfo != null) {
        fetchUsers(
                userID: userInfo?['id'],
                externalUserID: userInfo?['external_user_id'])
            .then((user) {
          setState(() {
            if (user == null) {
              return;
            }
            _user = user;
          });
        });
      } else {
        print("login user is record not found");
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User',
          style: TextStyle(
            color: Color.fromARGB(187, 129, 129, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        children: [
          Text('UserID: ${_user?.id}'),
          Text('UserExternalID: ${_user?.externalUserID}'),
          Text('Name: ${_user?.name}'),
          Text('Email: ${_user?.mailAddress}'),
        ],
      ),
    );
  }
}

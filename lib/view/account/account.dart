import 'package:flutter/material.dart';
import 'package:flutter_matching_app/model/user.dart';
import 'package:flutter_matching_app/services/app/api/v1/user_api.dart';
import 'package:flutter_matching_app/services/shared_preferences/user_info.dart';
import 'package:flutter_matching_app/component/drawer/user_info_drawer.dart';
import 'package:flutter_matching_app/theme/color.dart';

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
      endDrawer: userInfoDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          _user?.name ?? 'User Info',
          style: const TextStyle(
            color: mainColor,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: white,
        iconTheme: const IconThemeData(
          color: iconBlack,
          size: 26.0,
        ),
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

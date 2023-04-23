import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';
import 'package:flutter_matching_app/component/form/field/transform_rotate_text.dart';
import 'package:flutter_matching_app/component/form/field/date_pick.dart';

class UserEditForm extends StatefulWidget {
  @override
  _UserEditFormState createState() => _UserEditFormState();
}

class _UserEditFormState extends State<UserEditForm> {
  String selectedItem = '未選択';
  final List<String> lists = [
    '未選択',
    '学生',
    '社会人',
    'その他',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'プロフィール',
              style: TextStyle(
                color: black,
                fontSize: 18,
              ),
            ),
          ),
          // paddingTextfield('名前'),
          // paddingTextfield('カタカナ'),
          FormDropdownButto(name: '年齢'),
          // FormDropdownButto(name: '職業'),
          // FormDropdownButto(name: '職種'),
          const DatePickeBotton(),
          ElevatedButton(
            onPressed: () {
              // ボタンが押されたときの処理
            },
            child: const Text(
              '保存する',
              style: TextStyle(
                color: white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

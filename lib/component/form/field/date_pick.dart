import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';
// import 'package:flutter_matching_app/constants/user.dart';

class DatePickeBotton extends StatefulWidget {
  const DatePickeBotton({super.key});
  // final String name;

  // DatePickeBotton({required this.name});
  @override
  _DatePickeBottonState createState() => _DatePickeBottonState();
}

class _DatePickeBottonState extends State<DatePickeBotton> {
  DateTime _inputDate = DateTime.now();
  // : （省略）

  Future _openSample1(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await showDatePicker(
      context: context,
      // （4） 処理指定日付
      initialDate: DateTime(1930, 1, 1),
      // （5） 指定できる日付範囲
      firstDate: DateTime(1930, 1, 1),
      lastDate: DateTime(2010, 12, 31),
    );
    // （6） 選択された場合に、値を設定する
    if (_date != null) {
      setState(() {
        _inputDate = _date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          OutlinedButton(
              // （2） ボタンを押した時に入力できるようにする
              onPressed: () => _openSample1(context),
              child: const Text("日付選択")),
          // : （省略）
        ]));
  }
}

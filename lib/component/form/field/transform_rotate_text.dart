import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';
import 'package:flutter_matching_app/constants/user.dart';
import 'package:flutter_matching_app/component/form/field/user_picker.dart';

class FormDropdownButto extends StatefulWidget {
  final String name;

  FormDropdownButto({required this.name});
  @override
  _FormDropdownButtoState createState() => _FormDropdownButtoState();
}

class _FormDropdownButtoState extends State<FormDropdownButto> {
  String selectedItem = '';
  late final String listName;

  @override
  void initState() {
    super.initState();
    listName = widget.name;
    selectedItem = constantUserList[widget.name]![0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('タップイベント');
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return UserPicker(context: context, label: widget.name, val: '未指定');
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '年齢',
                style: TextStyle(
                  color: gray,
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Text(
                      '未指定',
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Icon(
                    IconData(0xf537, fontFamily: 'MaterialIcons'),
                    color: icongray,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

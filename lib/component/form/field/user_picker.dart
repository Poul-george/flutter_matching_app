import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_matching_app/constants/user.dart';

class UserPicker extends StatefulWidget {
  final BuildContext context;
  final String label;
  final String val;

  const UserPicker(
      {required this.label, required this.val, required this.context});

  @override
  _UserPickerState createState() => _UserPickerState();
}

class _UserPickerState extends State<UserPicker> {
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoPicker.builder(
        backgroundColor: white,
        scrollController:
            FixedExtentScrollController(initialItem: _selectedIndex),
        childCount: constantUserList[widget.label]!.length,
        itemExtent: 30,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final item = constantUserList[widget.label]![index];
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // TODO: タップイベント完成させたい
              print("念願のタップイベント");
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == index ? white : null,
              ),
              child: Center(
                child: Text(
                  "$item 歳",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == index ? mainColor : black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

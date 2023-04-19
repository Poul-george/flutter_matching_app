import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';
import 'package:flutter_matching_app/constants/user.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            fillColor: white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: black,
              ),
            ),
            filled: true,
            labelText: listName,
            labelStyle: const TextStyle(color: black)),
        value: selectedItem,
        items: constantUserList[listName]!
            .map((String list) =>
                DropdownMenuItem(value: list, child: Text(list)))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            selectedItem = value!;
          });
        },
      ),
    );
  }
}

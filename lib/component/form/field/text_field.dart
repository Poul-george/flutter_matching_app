
import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';

Widget paddingTextfield(String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
    child: TextField(
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(filled: true, fillColor: white, labelText: label),
    ),
  );
}

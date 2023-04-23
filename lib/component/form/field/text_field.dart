import 'package:flutter/material.dart';
import 'package:flutter_matching_app/theme/color.dart';

Widget paddingTextfield(String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
    child: TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1.0,
          ),
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          color: black,
        ),
        labelText: label,
        floatingLabelStyle: const TextStyle(fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: black,
            width: 1.0,
          ),
        ),
      ),
    ),
  );
}

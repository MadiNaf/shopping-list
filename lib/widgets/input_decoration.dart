import 'package:flutter/material.dart';
import 'package:shopping_list/utils/colors.dart';

InputDecoration useInputDecoration({Icon? icon, String? label}) {
  return InputDecoration(
      prefixIcon: icon,
      prefixText: label,
      fillColor: orangeLight33,
      filled: true,
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffdf7200))));
}

TextStyle useInputTextStyle() {
  return TextStyle(color: Colors.blueGrey[800]);
}

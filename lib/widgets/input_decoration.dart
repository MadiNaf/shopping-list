import 'package:flutter/material.dart';

InputDecoration getInputDecoration(Icon icon) {
  return InputDecoration(
      prefixIcon: icon,
      prefixIconColor: Colors.black87,
      fillColor: Colors.transparent,
      filled: true,
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffdf7200))));
}

TextStyle useInputTextStyle() {
  return TextStyle(color: Colors.blueGrey[800]);
}

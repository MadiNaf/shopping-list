import 'package:flutter/material.dart';

InputDecoration getInputDecoration(Icon icon) {
  return InputDecoration(
      prefixIcon: icon,
      prefixIconColor: Colors.blueGrey[200],
      fillColor: Colors.blueGrey[700],
      filled: true,
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent)));
}

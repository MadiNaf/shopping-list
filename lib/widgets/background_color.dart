import 'package:flutter/material.dart';

BoxDecoration useGradianBackground() {
  return const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffffbd77), Color(0xfff0f4a4), Color(0xffacfcd9)],
  ));
}
// #ffbd77 0%, #f0f4a4 37%, #acfcd9
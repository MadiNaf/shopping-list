import 'package:flutter/material.dart';
import 'package:shopping_list/utils/colors.dart';

BoxDecoration useGradianBackground() {
  return const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [orangeLight, yellowLight, greenLight],
  ));
}
// #ffbd77 0%, #f0f4a4 37%, #acfcd9
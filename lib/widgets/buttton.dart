import 'package:flutter/material.dart';
import 'package:shopping_list/utils/colors.dart';

Text usePrimaryButton(String label) {
  return Text(label, style: TextStyle(color: Colors.black87, fontSize: 18.0));
}

ButtonStyle useElevationButtonStyle() {
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
      backgroundColor: orangeLight);
}

ButtonStyle useElevationButtonSecondary() {
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
      backgroundColor: Colors.greenAccent);
}

Icon usePrimaryButtonIcon(IconData icon) {
  return Icon(icon, color: Colors.black87);
}

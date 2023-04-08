import 'package:flutter/material.dart';

Text getAppBarTitle(String title) {
  return Text(title,
      style: const TextStyle(
        color: Colors.white, // couleur du texte
        fontSize: 20, // taille du texte
        fontWeight: FontWeight.w600, // graisse du texte
      ));
}

Icon getAppBarActionIcon(Icon icon) {
  return const Icon(Icons.person,
      color: Colors.white, // couleur de l'icône
      size: 22);
}

Text getAppBarActionLabel(String label) {
  return Text(
    label,
    style: const TextStyle(
      color: Colors.white, // couleur du texte
      fontSize: 16, // taille du texte
      fontWeight: FontWeight.w600, // graisse du texte
    ),
  );
}

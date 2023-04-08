import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shopping_list/screens/Home/add_list.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/widgets/appbar_style.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // return Container(child: AddList());
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        elevation: 0.0,
        title: const Text('Connexion'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async => await _auth.signOut(),
            icon: getAppBarActionIcon(const Icon(Icons.logout)),
            label: getAppBarActionLabel('se deconnecter'),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_list/screens/Home/add_list.dart';
import 'package:shopping_list/screens/Home/widgets/shopping_list.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/background_color.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  final List<String> items = [
    'Acheter du pain',
    'Faire du sport',
    'Lire un livre'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: useGradianBackground(),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: GNav(
              gap: 6,
              tabBackgroundColor: Color(0x99ffbd77),
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Accueil',
                  onPressed: () => {},
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Liste des courses',
                  onPressed: () => {},
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Ajouter un produit',
                  onPressed: () => {},
                )
              ]),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: getAppBarTitle('Mes courses'),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () async => await _auth.signOut(),
                icon: getAppBarActionIcon(const Icon(Icons.logout)),
                label: getAppBarActionLabel('se deconnecter'),
              )
            ],
          ),
          body: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 12.0),
                  child: Card(
                      child: Container(
                    decoration: BoxDecoration(color: Color(0x99ffbd77)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ShoppingList(), Text('Tota : 0 €')],
                    ),
                  ))))),
    );
  }
}

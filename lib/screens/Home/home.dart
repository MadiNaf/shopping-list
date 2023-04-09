import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_list/screens/Home/widgets/item_form.dart';
import 'package:shopping_list/screens/Home/widgets/list_form.dart';
import 'package:shopping_list/screens/Home/widgets/shopping_list.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/utils/colors.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/background_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final List<String> items = [
    'Acheter du pain',
    'Faire du sport',
    'Lire un livre'
  ];

  int _currentIndexNav = 0;

  setCurrenIndexNav(int nexIndex) {
    setState(() {
      _currentIndexNav = nexIndex;
    });
  }

  GButton createGBButton(IconData icon, String label) {
    return GButton(icon: icon, text: label);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: useGradianBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: [
          ShoppingList(),
          ListForm(),
          ItemForm(),
          Center(
            child: Text('parametres'),
          )
        ][_currentIndexNav],
        bottomNavigationBar: GNav(
            selectedIndex: _currentIndexNav,
            onTabChange: (index) => setCurrenIndexNav(index),
            tabBackgroundColor: orangeLight99,
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
            tabs: [
              createGBButton(Icons.home, 'Accueil'),
              createGBButton(Icons.shopping_cart, 'Liste des courses'),
              createGBButton(Icons.add, 'Ajouter un produit'),
              createGBButton(Icons.settings, 'Paramètre')
            ]),
      ),
    );
  }
}

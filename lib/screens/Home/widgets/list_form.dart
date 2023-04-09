import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shopping_list/models/item.model.dart';
import 'package:shopping_list/utils/colors.dart';
import 'package:shopping_list/utils/mock.dart';
import 'package:shopping_list/utils/typographie.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class ListForm extends StatefulWidget {
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  String _scanBarcode = '';

  // MOCK ====================
  List<ItemEntity> mock = getDataMock();
  // =========================

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#EF6C00', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  List<Widget> displayCards() {
    List<Widget> cards = [];
    for (var i = 0; i < mock.length; i++) {
      cards.add(Card(
        color: orangeLight99,
        child: ListTile(
          leading: IconButton(icon: Icon(Icons.remove), onPressed: () => {}),
          title: Text(
            mock[i].name,
            style: headline6(),
          ),
          subtitle: Text('Quantité : 0',
              textAlign: TextAlign.center, style: headline6W9()),
          trailing: IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ),
      ));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      height: 380,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 60,
                width: 250,
                child: TextFormField(
                  decoration:
                      useInputDecoration(icon: const Icon(Icons.search)),
                  style: useInputTextStyle(),
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.barcode_reader),
              label: Text('Scanner un code barre.')),
          const SizedBox(height: 25),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: displayCards(),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       alignment: Alignment.center,
  //       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
  //       child: Column(
  //         children: [
  //           Text('Exemple de texte'),
  //           Row(
  //             children: [
  //               Icon(Icons.remove),
  //               SizedBox(width: 10),
  //               Text('Quantité'),
  //               SizedBox(width: 10),
  //               Icon(Icons.add),
  //             ],
  //           ),
  //           Text('Autre exemple de texte'),
  //         ],
  //       ));
  // }
}

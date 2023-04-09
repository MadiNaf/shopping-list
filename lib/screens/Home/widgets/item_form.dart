import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  // Item information
  String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#EF6C00', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
      child: Form(
          child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: useInputDecoration(
              Icon(Icons.message),
            ),
            style: useInputTextStyle(),
          ),
        ],
      )),
    );
  }

  // child: Flex(
  //           direction: Axis.vertical,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             ElevatedButton(
  //               onPressed: () => scanBarcodeNormal(),
  //               child: Text('Ajouter un produit par code barre'),
  //               style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.orange[800]),
  //             ),
  //             Text('Scan result : $_scanBarcode\n',
  //                 style: TextStyle(fontSize: 20))
  //           ])
}

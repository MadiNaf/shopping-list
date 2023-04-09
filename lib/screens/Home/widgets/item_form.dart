import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shopping_list/models/item.model.dart';
import 'package:shopping_list/utils/colors.dart';
import 'package:shopping_list/utils/form_validator.dart';
import 'package:shopping_list/utils/typographie.dart';
import 'package:shopping_list/widgets/add_mall.dart';
import 'package:shopping_list/widgets/buttton.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  late ItemEntity item;
  // Item information
  String itemName = '';
  String _scanBarcode = '';
  List<ItemPrice> prices = [];

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

  void addItemPrice(ItemPrice price) {
    setState(() {
      prices.add(price);
    });
  }

  SizedBox heightDivider({double height = 20.0}) {
    return SizedBox(height: height);
  }

  void showMall(BuildContext conext) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: orangeLight99,
      builder: (BuildContext context) {
        return SizedBox(
          height: (MediaQuery.of(context).size.height / 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.expand_more)),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: prices.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(prices[index].mall),
                    onDismissed: (direction) {
                      setState(() => prices.removeAt(index));
                    },
                    child: ListTile(
                      title: Text(
                        '${prices[index].mall} - ${prices[index].price} €',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          decoration: prices[index].mall.startsWith('x')
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() => prices.removeAt(index));
                        },
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        );
      },
    );
  }

  Widget showSubmitButton() {
    bool canSubmit = !itemName.isEmpty && prices.length >= 1;
    return canSubmit
        ? ElevatedButton.icon(
            onPressed: () => scanBarcodeNormal(),
            icon: usePrimaryButtonIcon(Icons.check),
            label: usePrimaryButton('Ajouter le produit'),
            style: useElevationButtonSecondary())
        : Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
            child: Column(
          children: [
            Text(
              'Code barre :  $_scanBarcode',
              style: headline6(),
            ),
            heightDivider(height: 18.0),
            TextFormField(
              validator: requiredField,
              decoration: useInputDecoration(
                  icon: Icon(Icons.sell), label: 'Nom du produit : '),
              style: useInputTextStyle(),
              onChanged: (value) => setState(() => itemName = value),
            ),
            heightDivider(),
            Card(
              color: orangeLight66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '${prices.length} Magasin(s) ajouter.',
                    style: headline6(),
                  ),
                  TextButton(
                    child: Text('VOIR LES MAGASINS', style: headline6W9()),
                    onPressed: () => showMall(context),
                  ),
                ],
              ),
            ),
            heightDivider(),
            AddMall(
              callback: (value) => addItemPrice(value),
            ),
            heightDivider(),
            ElevatedButton.icon(
                onPressed: () => scanBarcodeNormal(),
                icon: usePrimaryButtonIcon(Icons.barcode_reader),
                label: usePrimaryButton('Ajouter un code barre'),
                style: useElevationButtonStyle()),
            heightDivider(),
            showSubmitButton(),
          ],
        )),
      ),
    );
  }
}

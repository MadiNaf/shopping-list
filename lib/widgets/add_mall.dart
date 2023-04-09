import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.model.dart';
import 'package:shopping_list/utils/form_validator.dart';
import 'package:shopping_list/widgets/buttton.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class AddMall extends StatefulWidget {
  final Function callback;

  AddMall({required this.callback});

  @override
  _AddMallState createState() => _AddMallState();
}

class _AddMallState extends State<AddMall> {
  final _mallFormKey = GlobalKey<FormState>();
  late ItemPrice itemPrice;

  bool _showForm = false;

  // Text field
  String mall = '';
  String price = '';

  void _handleSubmitButton() {
    bool formSended = false;
    if (_showForm && _mallFormKey.currentState != null) {
      if (_mallFormKey.currentState!.validate()) {
        itemPrice = ItemPrice(price: double.parse(price), mall: mall);
        formSended = true;
        widget.callback(itemPrice);
      }
    }
    setState(() => _showForm = !formSended);
  }

  SizedBox _heightDivider({double height = 20.0}) {
    return SizedBox(height: height);
  }

  Widget _getForm() {
    List<Widget> form = [
      TextFormField(
        validator: requiredField,
        decoration: useInputDecoration(icon: const Icon(Icons.store)),
        style: useInputTextStyle(),
        onChanged: (value) => setState(() => mall = value),
      ),
      _heightDivider(),
      TextFormField(
        validator: priceValidator,
        decoration: useInputDecoration(icon: const Icon(Icons.euro)),
        style: useInputTextStyle(),
        onChanged: (value) => setState(() => price = value),
      ),
      _heightDivider(),
    ];
    return Form(
        key: _mallFormKey,
        child: Column(
          children: _showForm ? form : [],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getForm(),
        ElevatedButton.icon(
            onPressed: _handleSubmitButton,
            icon: usePrimaryButtonIcon(Icons.add_business),
            label:
                usePrimaryButton(_showForm ? 'Valider' : 'Ajouter un magasin'),
            style: useElevationButtonStyle())
      ],
    );
  }
}

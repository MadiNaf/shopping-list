import 'package:flutter/material.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/utils/form_validator.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  // Text field
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        elevation: 0.0,
        title: getAppBarTitle('Connexion'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: getAppBarActionIcon(const Icon(Icons.person)),
            label: getAppBarActionLabel('s\'inscrir'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Form(
              child: Column(
            key: _formKey,
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) => emailValidator(value),
                decoration: getInputDecoration(const Icon(Icons.email)),
                style: TextStyle(color: Colors.blueGrey[100]),
                onChanged: (value) => setState(() => email = value),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                validator: (value) => passwordValidator(value),
                decoration: getInputDecoration(const Icon(Icons.lock)),
                style: TextStyle(color: Colors.blueGrey[100]),
                obscureText: true,
                onChanged: (value) => setState(() => password = value),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                child: const Text('Je me connecte'),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                    backgroundColor: Colors.orange[800]),
                onPressed: signin,
              ),
            ],
          ))),
    );
  }

  void signin() async {
    if (_formKey.currentState!.validate()) {
      dynamic user = await _auth.signInAnon();
      if (user == null) {
        print('error sign in');
      } else {
        print('user sign in');
        print(user);
      }
    }
  }
}

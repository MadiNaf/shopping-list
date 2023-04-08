import 'package:flutter/material.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({required this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  // Text field
  String email = '';
  String password = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        elevation: 0.0,
        title: const Text('Inscription'),
        actions: [
          TextButton.icon(
            onPressed: () => widget.toggleView(),
            icon: getAppBarActionIcon(const Icon(Icons.person)),
            label: getAppBarActionLabel('se connecter'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Form(
              child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: getInputDecoration(const Icon(Icons.email)),
                style: TextStyle(color: Colors.blueGrey[100]),
                onChanged: (value) => setState(() => email = value),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                decoration: getInputDecoration(const Icon(Icons.lock)),
                style: TextStyle(color: Colors.blueGrey[100]),
                obscureText: true,
                onChanged: setPasswordState,
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                decoration: getInputDecoration(const Icon(Icons.lock)),
                style: TextStyle(color: Colors.blueGrey[100]),
                obscureText: true,
                onChanged: setPasswordConfirmation,
              ),
              const SizedBox(height: 10.0),
              Text(
                errorMessage,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 25.0),
                    backgroundColor: Colors.orange[800]),
                onPressed: userRegister,
                child: const Text('Je m\'inscrit '),
              ),
            ],
          ))),
    );
  }

  void setPasswordState(value) {
    errorMessage = value.length < 6
        ? 'Le mot de passe doit faire au moins 6 caractères!'
        : '';
    setState(() => password = value);
  }

  void setPasswordConfirmation(value) {
    errorMessage =
        password != value ? 'Le mot de passe ne corresponds pas!' : '';
  }

  void userRegister() async {
    dynamic user = await _auth.signInAnon();
    if (user == null) {
      print('error sign in');
    } else {
      print('user sign in');
      print(user);
    }
  }
}

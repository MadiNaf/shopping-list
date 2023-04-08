import 'package:flutter/material.dart';
import 'package:shopping_list/screens/auth/widgets/signin.dart';
import 'package:shopping_list/screens/auth/widgets/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool hasAnAccount = true;

  void toggleView() {
    setState(() => hasAnAccount = !hasAnAccount);
  }

  @override
  Widget build(BuildContext context) {
    return hasAnAccount
        ? SignIn(toggleView: toggleView)
        : SignUp(toggleView: toggleView);
  }
}

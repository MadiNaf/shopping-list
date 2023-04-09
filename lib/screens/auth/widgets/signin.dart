import 'package:flutter/material.dart';
import 'package:shopping_list/models/user.model.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/utils/colors.dart';
import 'package:shopping_list/utils/form_validator.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/background_color.dart';
import 'package:shopping_list/widgets/buttton.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _loginFormKey = GlobalKey<FormState>();

  // Text field
  String email = '';
  String password = '';
  String errMessage = '';

  void signin() async {
    if (_loginFormKey.currentState != null &&
        _loginFormKey.currentState!.validate()) {
      UserEntity user = await _auth.signInWithEmailAndPassword(email, password);
      if (user.isEmptyUser()) {
        setState(() => errMessage = 'Une erreur est survenue.');
      }
    }
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
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    TextFormField(
                      validator: emailValidator,
                      decoration:
                          useInputDecoration(icon: const Icon(Icons.email)),
                      style: useInputTextStyle(),
                      onChanged: (value) => setState(() => email = value),
                    ),
                    const SizedBox(height: 25.0),
                    TextFormField(
                      validator: passwordValidator,
                      decoration:
                          useInputDecoration(icon: const Icon(Icons.lock)),
                      style: useInputTextStyle(),
                      obscureText: true,
                      onChanged: (value) => setState(() => password = value),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      style: useElevationButtonStyle(),
                      onPressed: signin,
                      child: usePrimaryButton('Valider'),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      errMessage,
                      style: const TextStyle(color: redError, fontSize: 14.0),
                    )
                  ],
                ))),
      ),
    );
  }
}

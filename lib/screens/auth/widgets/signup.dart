import 'package:flutter/material.dart';
import 'package:shopping_list/models/user.model.dart';
import 'package:shopping_list/services/auth.dart';
import 'package:shopping_list/utils/form_validator.dart';
import 'package:shopping_list/widgets/appbar_style.dart';
import 'package:shopping_list/widgets/background_color.dart';
import 'package:shopping_list/widgets/buttton.dart';
import 'package:shopping_list/widgets/input_decoration.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({required this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  final _registerFormKey = GlobalKey<FormState>();

  // Text field
  String email = '';
  String password = '';
  String pwdConfirm = '';
  String errMessage = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: useGradianBackground(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: getAppBarTitle('Inscription'),
            actions: [
              TextButton.icon(
                onPressed: () => widget.toggleView(),
                icon: getAppBarActionIcon(const Icon(Icons.person)),
                label: getAppBarActionLabel('se connecter'),
              )
            ],
          ),
          body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      TextFormField(
                        validator: emailValidator,
                        decoration: getInputDecoration(const Icon(Icons.email)),
                        cursorColor: Colors.blueGrey[800],
                        style: useInputTextStyle(),
                        onChanged: (value) => setState(() => email = value),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        validator: passwordValidator,
                        decoration: getInputDecoration(const Icon(Icons.lock)),
                        cursorColor: Colors.blueGrey[800],
                        style: useInputTextStyle(),
                        obscureText: true,
                        onChanged: (value) => setState(() => password = value),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        validator: (value) =>
                            passwordConfirmationValidator(password, value),
                        cursorColor: Colors.blueGrey[800],
                        decoration: getInputDecoration(const Icon(Icons.lock)),
                        style: useInputTextStyle(),
                        obscureText: true,
                        onChanged: (value) =>
                            setState(() => pwdConfirm = value),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 25.0),
                            backgroundColor: const Color(0xffffbd77)),
                        onPressed: userRegister,
                        child: usePrimaryButton('Valider'),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        errMessage,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ))),
        ));
  }

  void userRegister() async {
    if (_registerFormKey.currentState != null &&
        _registerFormKey.currentState!.validate()) {
      UserEntity user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user.isEmptyUser()) {
        setState(() => errMessage = 'Une erreur est survenue.');
      }
    }
  }
}

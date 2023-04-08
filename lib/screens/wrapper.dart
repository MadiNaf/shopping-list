import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/user.model.dart';
import 'package:shopping_list/screens/Home/home.dart';
import 'package:shopping_list/screens/auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider?.of<UserEntity>(context);
    return currentUser.isEmptyUser() ? Authenticate() : Home();
    // if (currentUser.isEmptyUser()) {
    //   return Authenticate();
    // } else {
    //   return Home();
    // }
  }
}

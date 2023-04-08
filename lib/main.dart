import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/user.model.dart';
import 'package:shopping_list/screens/wrapper.dart';
import 'package:shopping_list/services/auth.dart';

void main() async {
  // Ensures that Flutter widgets are initialized before anything else.
  // This line is required for Flutter to work properly.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserEntity>.value(
        value: AuthService().user,
        initialData: UserEntity(uid: '', email: ''),
        child: MaterialApp(home: Wrapper()));
  }
}

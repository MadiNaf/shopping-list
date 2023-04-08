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
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: customPrimaryColor(),
            ),
            home: Wrapper(),
            debugShowCheckedModeBanner: false));
  }

  MaterialColor customPrimaryColor() {
    return const MaterialColor(0xffdf7200, <int, Color>{
      50: Color(0xffdf7200),
      100: Color(0xffdf7200),
      200: Color(0xffdf7200),
      300: Color(0xffdf7200),
      400: Color(0xffdf7200),
      500: Color(0xffdf7200),
      600: Color(0xffdf7200),
      700: Color(0xffdf7200),
      800: Color(0xffdf7200),
      900: Color(0xffdf7200),
    });
  }
}

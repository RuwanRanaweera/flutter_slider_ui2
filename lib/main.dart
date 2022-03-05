import 'package:flutter/material.dart';
import 'package:myapp1/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introduction_screen.dart';

//import 'introduction_screen.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter On Bording',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: IntroScreen(),
      home: show ? IntroScreen() : const HomeScreen(),
    );
  }
}

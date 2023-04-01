// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/screens/splashscreen%20.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Widget foo = Container(child: Builder(builder: (BuildContext context) => bar));
Widget bar = Container(child: Builder(builder: (BuildContext context) => foo));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp(Builder(builder: (BuildContext context) => foo)));
}

class MyApp extends StatelessWidget {
  MyApp(Builder builder);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

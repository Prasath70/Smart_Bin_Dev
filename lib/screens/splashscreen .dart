import 'package:flutter/material.dart';
import 'package:flutter_database/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:flutter_database/screens/login_screen.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => email == '' ? LoginScreen() : Contacts(email)));
    });
  }

  String email = '';
  void getvalue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset('assets/logo2.png'),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Text("Powered By",
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 20)),
                Center(
                  child: Image.asset(
                    "assets/sreclogo.png",
                    height: 100,
                    width: 100,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

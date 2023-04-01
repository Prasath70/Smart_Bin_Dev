import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/screens/homescreen.dart';
import 'package:flutter_database/screens/splashscreen%20.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  String email = '';
  String password = '';
  String error = '';
  bool visible = true;
  void passwordvisible() {
    setState(() {
      visible ? visible = false : visible = true;
    });
  }

  Future<void> keeplogin(emailvalue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', emailvalue);
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) async => {
                await keeplogin(email),
                Fluttertoast.showToast(msg: "Login Successfully"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Contacts(email))),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e?.message);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    //email
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return null;
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "Invalid Email";
          }
        },
        autovalidate: true,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter User ID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: visible,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return null;
          }
          if (!regex.hasMatch(value)) {
            return "Please Enter a valid Password(Min 6 characters)";
          }

          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: InkWell(
            child:
                visible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            onTap: passwordvisible,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //LoginButton
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return loading
        ? splash()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Watch Your Waste",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blueGrey,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 36),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: 200,
                              child: Image.asset(
                                "assets/logo3.png",
                                height: 800,
                                width: 800,
                              )),
                          Text(
                            "User Login",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 45),
                          emailField,
                          SizedBox(height: 45),
                          passwordField,
                          SizedBox(height: 45),
                          loginButton,
                          SizedBox(height: 15),
                          Container(
                            child: ElevatedButton(
                                child: Icon(CupertinoIcons.search),
                                onPressed: () async {
                                  final url =
                                      'https://watchyourwaste.wa.gov.au/';
                                  await launch(
                                    url,
                                    forceWebView: true,
                                    enableJavaScript: true,
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

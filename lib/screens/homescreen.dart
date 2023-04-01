import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/model/pusnotification_model.dart';
import 'package:flutter_database/screens/login_screen.dart';
import 'package:flutter_database/screens/update.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Contacts extends StatefulWidget {
  var values;

  Contacts(this.values);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  PushNotificationModel? _notificationInfo;
  late final FirebaseMessaging messaging;
  var token;
  double val1 = 0;
  double val2 = 0;
  double val3 = 0;
  String val4 = '';
  String str1 = '';
  String str2 = '';
  String str3 = '';
  String str4 = '';
  double val6 = 0;
  double val7 = 0;
  double val8 = 0;
  double val5 = 0;
  double val9 = 0;
  double val10 = 0;
  double val11 = 0;
  double val12 = 0;
  int height1 = 0;
  double temp1 = 0;
  double temp2 = 0;
  double temp3 = 0;

  int percent1 = 0;
  int percent2 = 0;
  int percent3 = 0;

  int cpercent1 = 0;
  int cpercent2 = 0;
  int cpercent3 = 0;
  int wh1 = 0;
  int wh2 = 0;
  int wh3 = 0;

  Query? _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('bin_data');

  checkForInitializeMessage() async {
    RemoteMessage? initialsms =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialsms != null) {
      PushNotificationModel notification = PushNotificationModel(
          title: initialsms.notification!.title,
          body: initialsms.notification!.body,
          datatitle: initialsms.data["title"],
          dataBody: initialsms.data["body"]);
      setState(() {
        _notificationInfo = notification;
      });
    }
  }

  void registerNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true, badge: true, provisional: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("granted");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationModel notification = PushNotificationModel(
            title: message.notification!.title,
            body: message.notification!.body,
            datatitle: message.data["title"],
            dataBody: message.data["body"]);
        setState(() async {
          _notificationInfo = notification;
        });

        if (notification != null) {
          showSimpleNotification(Text(_notificationInfo!.title),
              subtitle: Text(_notificationInfo!.body),
              background: Colors.transparent.withOpacity(0.1),
              duration: const Duration(seconds: 2));
        }
      });
    }
  }

  Future<void> keeplogin(emailvalue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', emailvalue);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('bin_data')
        .orderByChild('binname');
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
      get(token);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotificationModel notification = PushNotificationModel(
          title: message.notification!.title,
          body: message.notification!.body,
          datatitle: message.data["title"],
          dataBody: message.data["body"]);
      setState(() {
        _notificationInfo = notification;
      });
    });

    registerNotification();
    checkForInitializeMessage();
  }

  Widget _buildContactItem({Map? contact}) {
    str1 = contact?['var1'];
    str2 = contact?['var2'];
    str3 = contact?['var3'];
    val1 = double.parse(contact?['bin1']);
    val2 = double.parse(contact?['bin2']);
    val3 = double.parse(contact?['bin3']);
    height1 = int.parse(contact?['binheight']);
    if (val1 < 85) {
      if (val1 > 20 && val1 <= 85) {
        temp1 = val1 - int.parse(contact?['emptyspace']);
        val5 = ((height1 - temp1) / height1 * 100).abs();

        if (val5 < 100) {
          val9 = (val5.abs() / 100);
          if (val9 <= 100) {
            percent1 = val5.toInt();
          } else {
            percent1 = 100;
            percent1 = val5.toInt();
          }
        } else {
          val9 = 1;

          percent1 = 100;
        }
        ;
      } else {
        val9 = 1;
        percent1 = 100;
      }
    } else {
      val9 = 0;
      percent1 = 0;
    }

    if (val2 < 85) {
      if (val2 > 20 && val2 <= 85) {
        temp2 = val2 - int.parse(contact?['emptyspace']);
        val6 = ((height1 - temp2) / height1 * 100).abs();

        if (val6 < 100) {
          val10 = (val6.abs() / 100);
          if (val6 <= 100) {
            percent2 = val6.toInt();
          } else
            () {
              percent2 = 100;
            };
        } else {
          val10 = 1;

          percent2 = 100;
        }
        ;
      } else {
        val10 = 1;
        percent2 = 100;
      }
    } else {
      val10 = 0;
      percent2 = 0;
    }

    if (val3 < 85) {
      if (val3 > 20 && val3 <= 85) {
        temp3 = val3 - int.parse(contact?['emptyspace']);
        val7 = ((height1 - temp3) / height1 * 100).abs();
        val11 = (val7.abs() / 100);

        if (val7 < 100) {
          val11 = (val7.abs() / 100);
          if (percent3 <= 100) {
            percent3 = val7.toInt();
          } else {
            percent3 = 100;
          }
          ;
        } else {
          val11 = 1;
          percent3 = 100;
        }
        ;
      } else {
        val11 = 1;
        percent3 = 100;
      }
    } else {
      val11 = 0;
      percent3 = 0;
    }
    Checkcolor(var b, var c, var d) {
      if (b >= 90 || c >= 90 || d >= 90) {
        return Colors.red[300];
      } else {
        return Colors.white;
      }
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          color: Checkcolor(percent1, percent2, percent3),
          child: ListTile(
            leading: CircleAvatar(
              foregroundImage: AssetImage("assets/bin1.png"),
              radius: 25.0,
              backgroundColor: Colors.blue,
            ),
            trailing: Icon(Icons.settings),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditContact(
                            contactKey: contact?['key'],
                          )));
            },
            title: Text(
              contact?['binname'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(contact?['location'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCCFF90),
        centerTitle: true,
        title: Text("Meridian Spicktech",
            style: TextStyle(
                fontFamily: 'Nunito', fontSize: 25, color: Colors.black)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            onPressed: () async {
              setState(() {
                keeplogin('');
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: Container(
        color: Color(0xFFCCFF90),
        height: double.infinity,
        child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map contact = snapshot.values;
              contact['keys'] = snapshot.key
                return _buildContactItem(contact: contact);
                }
          
        )
      ),
    );
  }
}

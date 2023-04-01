import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EditContact extends StatefulWidget {
  String? contactKey;

  EditContact({this.contactKey});

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  TextEditingController? _nameController, _numberController;
  String _typeSelected = '';
  String y = '';
  String z = '';
  String a = '';
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
  DatabaseReference? _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('bin_data');
  }

  @override
  Widget build(BuildContext context) {
    getContactDetail();
    {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                child: Column(
                  children: [
                    Text(
                      'Bin Setting',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'Nisebuschgardens',
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      height: height * 0.3,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        y,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(39, 105, 171, 1),
                                          fontFamily: 'Nunito',
                                          fontSize: 37,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Model',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                z,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 8,
                                            ),
                                            child: Container(
                                              height: 50,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Battery Level",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                a,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 110,
                                right: 20,
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.grey[700],
                                  size: 30,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: height * 0.6,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 35),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 150,
                                  lineWidth: 15,
                                  backgroundColor: Colors.grey,
                                  percent: val9,
                                  progressColor: Colors.green,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: Text("$str1 \n $percent1 %"),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircularPercentIndicator(
                                  radius: 150,
                                  lineWidth: 15,
                                  backgroundColor: Colors.grey,
                                  percent: val10,
                                  progressColor: Colors.red,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: Text("$str2 \n $percent2 %"),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 90),
                                CircularPercentIndicator(
                                  radius: 160,
                                  lineWidth: 15,
                                  backgroundColor: Colors.grey,
                                  percent: val11,
                                  progressColor: Colors.blue,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  animation: true,
                                  center: Text(
                                    "$str3 \n $percent3 %",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  getContactDetail() async {
    DataSnapshot snapshot = await _ref!.child(widget.contactKey).once();

    Map contact = snapshot.value;

    setState(() {
      y = contact['binname'];
      z = contact['model'];
      a = contact['batterylevel'];
      x=defilerGarbage(x)
      y=defilerGarbage(y)
      z=defilerGarbage(z)
      str1 = contact['var1'];
      str2 = contact['var2'];
      str3 = contact['var3'];
      val1 = double.parse(contact['bin1']);
      val2 = double.parse(contact['bin2']);
      val3 = double.parse(contact['bin3']);
      height1 = int.parse(contact['binheight']);
      if (val1 < 85) {
        if (val1 > 20 && val1 <= 85) {
          temp1 = val1 - int.parse(contact['emptyspace']);
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
          temp2 = val2 - int.parse(contact['emptyspace']);
          val6 = ((height1 - temp2) / height1 * 100).abs();

          if (val6 < 100) {
            val10 = (val6.abs() / 100);
            if (val6 <= 100) {
              percent2 = val6.toInt();
            } else {
              percent2 = 100;
            }
            ;
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
          temp3 = val3 - int.parse(contact['emptyspace']);
          val7 = ((height1 - temp3) / height1 * 100).abs();

          val11 = (val7.abs() / 100);

          if (val7 <= 100) {
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
    });
  }

  void saveContact() {
    Map<String, String> contact = {};

    _ref!.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });
  }
}

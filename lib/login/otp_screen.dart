import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/provider/auth_provider.dart';
import 'package:immigration/screens/MainScreen.dart';
import 'package:immigration/screens/UserProfileDetails.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FocusNode firstNode = FocusNode();
  FocusNode secondNode = FocusNode();
  FocusNode thirdNode = FocusNode();
  FocusNode fourthNode = FocusNode();
  FocusNode fifthNode = FocusNode();
  FocusNode sixthNode = FocusNode();
  FocusNode buttonNode = FocusNode();

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();
  TextEditingController fifthController = TextEditingController();
  TextEditingController sixthController = TextEditingController();

  TextEditingController otpController = TextEditingController();
  bool countDownComplete = false;

  var duration;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 10;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    log("-----interval-----------$interval-");

    setState(() {
      duration = interval;
    });
    log("-----duration--------$duration--");
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          setState(() {
            countDownComplete = true;
          });
          timer.cancel();
        }
      });
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK!'),
          )
        ],
      ),
    );
  }

  Future<String> check(String uId) async {
    var res = await http.get(Uri.parse(
        "https://frozen-savannah-16893.herokuapp.com/User/check/$uId"));
    if (res.statusCode == 200) {
      print("hgkj8888888888888" + res.body);
      return res.body;
    }
    return res.body;
  }
  int? statuscode = 100;

  verifyOTP(BuildContext context) {
    
    try {
      Provider.of<AuthProvider>(context, listen: false)
          .verifyOTP(firstController.text +
              secondController.text +
              thirdController.text +
              fourthController.text +
              fifthController.text +
              sixthController.text)
          .whenComplete(() {
           
        print("-----------============------" +
            FirebaseAuth.instance.currentUser!.uid.toString());
            
        if (check(FirebaseAuth.instance.currentUser!.uid.toString()) ==
            "true") {
               setState(() {
             
              statuscode == 100;
            });
          return Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainScreen(0)));
        } else {
          return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfile(
                      uId: FirebaseAuth.instance.currentUser!.uid)));
        }

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Register(),
        //     ));
      }).catchError((e) {
        final otpCon = firstController.text +
            secondController.text +
            thirdController.text +
            fourthController.text +
            fifthController.text +
            sixthController.text;
        String errorMsg = 'Cant authentiate you Right now, Try again later!';
        if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
          errorMsg = "Session expired, please resend OTP!";
        } else if (e.toString().contains("ERROR_INVALID_VERIFICATION_CODE")) {
          errorMsg = "You have entered wrong OTP!";
        } else if (otpCon.isEmpty) {
          errorMsg = "Please enter OTP";
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    firstNode = FocusNode();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   firstNode.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.35,
                      width: width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/pathBlue.png"))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Enter OTP here",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          Text(
                            "We sent you one time password on \n+91${Provider.of<AuthProvider>(context, listen: false).controllerPhone.text.toString()}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: firstNode,
                          maxLength: 1,
                          controller: firstController,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(secondNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: secondNode,
                          maxLength: 1,
                          controller: secondController,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(thirdNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: thirdNode,
                          maxLength: 1,
                          controller: thirdController,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(fourthNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: fourthNode,
                          controller: fourthController,
                          maxLength: 1,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(fifthNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: fifthNode,
                          controller: fifthController,
                          maxLength: 1,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(sixthNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          focusNode: sixthNode,
                          controller: sixthController,
                          maxLength: 1,
                          //style: inputOtpTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.all(18.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            FocusScope.of(context).requestFocus(buttonNode);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(timerText),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                (countDownComplete == false)
                    ? TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text("Don't recieve OTP? Resend!",
                            style: TextStyle(color: Colors.grey)),
                        onPressed: () {
                          //Navigator.pop(context);
                        },
                      )
                    : TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text("Don't recieve OTP? Resend!",
                            style: TextStyle(color: kBlueColor)),
                        onPressed: () {
                          //Navigator.pop(context);
                        },
                      ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.3,
                  child: ElevatedButton(
                    autofocus: true,
                    focusNode: buttonNode,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) => kBlueColor)),
                    onPressed: () {
                      verifyOTP(context);
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: statuscode == 200
                  ? AlertDialog(
                insetPadding:
                EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                content: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: SpinKitCubeGrid(
                    color: kBlueColor,
                  ),
                ),
              )
                  : Container())
        ],
      ),
    );
  }
}

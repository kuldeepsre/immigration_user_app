import 'package:flutter/material.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/login/otp_screen.dart';
import 'package:immigration/provider/auth_provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  verifyPhone(BuildContext context) async {
    String countryCode = "+91";
    try {
      Provider.of<AuthProvider>(context, listen: false)
          .verifyPhone(
              countryCode,
              countryCode +
                  Provider.of<AuthProvider>(context, listen: false)
                      .controllerPhone
                      .text
                      .toString())
          .then((value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpScreen(),
        ));
      }).catchError((e) {
        String errorMsg = 'Cant Authenticate you, Try Again Later';
        if (Provider.of<AuthProvider>(context, listen: false)
                .controllerPhone
                .text
                .length <
            10) {
          String errorMsg = "Please enter mobile number";
          _showErrorDialog(context, errorMsg);
        } else if (e.toString().contains(
            'We have blocked all requests from this device due to unusual activity. Try again later.')) {
          errorMsg = 'Please wait as you have used limited number request';
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
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

  //TextEditingController phoneController = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
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
                    children: [
                      // Image.asset(
                      //   "assets/images/logo.png",
                      //   height: height * 0.15,
                      //   width: width,
                      // ),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                          height: 160,
                          width: 160,
                        ),
                      ),

                      Text(
                        "Immigration Adda",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  "Login Here!",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InternationalPhoneNumberInput(

                cursorColor: kBlueColor,
                inputDecoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                ),
                textFieldController:
                    Provider.of<AuthProvider>(context, listen: false)
                        .controllerPhone,
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                initialValue: number,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: height * 0.07,
              width: width * 0.3,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => kBlueColor)),
                  onPressed: () {
                    if (Provider.of<AuthProvider>(context, listen: false)
                            .controllerPhone
                            .text
                            .length <
                        10) {
                      return _showErrorDialog(
                          context, "Enter valid mobile number!");
                    }
                    verifyPhone(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

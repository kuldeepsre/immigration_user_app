import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immigration/login/login_screen.dart';
import 'package:immigration/screens/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  decider(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,AsyncSnapshot<User?> snapshot){

          //final uid =snapshot.data!.uid;
          if(snapshot.data == null){
            return LoginScreen();
          }else{
            return MainScreen(0);
          }

          return CircularProgressIndicator();

    });
  }

  void initState() {

    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> decider()));
    });


//       String? _user = "";
//     if(FirebaseAuth.instance.currentUser!=null){
//       _user=FirebaseAuth.instance.currentUser!.uid;
//     }
//     print("object"+_user);
// if(_user==""){
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//         builder: (context) => LoginScreen()
//     ),
//   );
//
// }else{
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//         builder: (context) => MainScreen()
//     ),
//   );
// }
//     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/topdesign.png"),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(74.0),
              child: Image.asset("assets/images/logo.png"),
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/images/bottomdesign.png")),
      ],
    ));
  }
}

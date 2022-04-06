import 'package:flutter/material.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Image.asset("assets/images/topdesign.png"),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 150,
                      width: 150,
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
                child: Column(
                  children: [
                Text(
              "Your Phone!",

              style: TextStyle(fontFamily: "Schuyler",
                  shadows: <Shadow>[
                  Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xff475298)),
            ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontFamily: "Schyler",
                            color: Color(0xff475298)),
                        ),
                      ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 180,
                        child: TextField(

                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                        textAlign: TextAlign.start,
                          style: TextStyle(
                            letterSpacing: 1.5
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:InputDecoration(

                            hintText: "*********",
                            hintStyle: TextStyle(
                              letterSpacing: 1
                            )
                          )
                        ),
                      ),
                    )

                  ]
                ))),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/images/bottomdesign.png"))
            ],
          ),
        ),
      ],
    ));
  }
}

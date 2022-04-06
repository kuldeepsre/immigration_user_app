import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/abroad.dart';
import 'package:immigration/matrimonial/Screens/business.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class IletsTofelCelpip extends StatefulWidget {
  const IletsTofelCelpip({Key? key}) : super(key: key);

  @override
  _IletsTofelCelpipState createState() => _IletsTofelCelpipState();
}

class _IletsTofelCelpipState extends State<IletsTofelCelpip> {
  List<String>? whatucleared = [
    'IELTS',
    'TOFEL',
    'CELPIP',
    'PTE',
    'CD-IELTS',
    'NAATI',
    'CAEL',
    'Pursuing',
    'None'
  ];
  List<String>? Score=['4.5','5','5.5','6','6.5','7','7.5','8','8.5','9','None'];

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  String? selectedWhatucleared = '';


  DateTime selectedPassingDate= DateTime.now();

  DateTime selectedExpiryDate= DateTime.now();

  String? selectedScore;

  uploadData() async {
    _postFunction.postIlets({
       "mId": '0123',
      "iletsClearedFrom": selectedWhatucleared,
      "scoredOrBand": selectedScore,
      "iletsPassingDate": selectedPassingDate.toLocal().toString().split(' ')[0],
      "iletsExpiryDate": selectedExpiryDate.toLocal().toString().split(' ')[0],
    });
  }

  String? selectedValue;
  bool isSubmitted = false;
 // DateTime selectedDate = DateTime.now();


  // pickExpiryDate() {
  //   DatePickerDialog(
  //     // currentDate: ,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now().subtract(const Duration(days: 70000)),
  //       lastDate: DateTime.now());
  // }

  _selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedExpiryDate,
        firstDate: DateTime(1989),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedExpiryDate) {
      setState(() {
        selectedExpiryDate = picked;
      });
      print(selectedExpiryDate);
    }
  }




  // pickPassingDate() {
  //   DatePickerDialog(
  //       // currentDate: ,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now().subtract(const Duration(days: 70000)),
  //       lastDate: DateTime.now());
  // }

   _selectPassDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedPassingDate,
        firstDate: DateTime(1989),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedPassingDate) {
      setState(() {
        selectedPassingDate = picked;
      });
      print(selectedPassingDate);
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Business()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Business()),
              );
            },
            child: const Center(
              child: Text(
                'Immigration Adda',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'ILETS/ TOFEL/ CELPIP',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                       shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.3),borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Which test have you done ',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: whatucleared!
                                .map((e) => InkWell(
                                    onTap: () {
                                      var object = "I LIKE JAVA";

                                      setState(() {
                                        selectedWhatucleared = e;
                                      });
                                      print(selectedWhatucleared);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 90.0,
                                          padding: const EdgeInsets.all(4.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                                width: 0.7, color: Colors.grey),
                                            color: (e == selectedWhatucleared)
                                                ? kRedColor
                                                : Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: (e ==
                                                            selectedWhatucleared)
                                                       ? Colors.white
                                                      : Colors.black)),
                                          )),
                                    )))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(

                       shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.3),borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'How many overall Score did you get ',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: Score!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedScore = e;
                                  });
                                  print(selectedScore);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedScore)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e ==
                                                    selectedScore)
                                                    ? Colors.white
                                                    : Colors.black)),
                                      )),
                                )))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
             
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    child: TextField(
                      readOnly: true,
                      // enabled: false,
                      onTap: () => _selectPassDate(context),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller:
                      TextEditingController(
                          text:selectedPassingDate.toLocal().toString().split(' ')[0]
                      ),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 15, bottom: 6, left: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        labelText: 'Passing Date',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff5275),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // CustomTextField(isSubmitted: isSubmitted, context: context, controller: expiryDateController, labelText: 'Expire Date '),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    child: TextField(
                      readOnly: true,
                      // enabled: false,
                      onTap: () => _selectExpiryDate(context),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller: TextEditingController(
                        text: selectedExpiryDate.toLocal().toString().split(' ')[0]
                      ),
                      decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.only(top: 15, bottom: 6, left: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        labelText: 'Expiry Date',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff5275),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      //color: Color(0xff0d47a1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffff5275),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isSubmitted = true;
                          });
                          if (selectedPassingDate
                              .toLocal()
                              .toString()
                              .split(' ')[0]
                              .isEmpty) {
                            print('Expiry Date');
                          } else if (selectedExpiryDate
                              .toLocal()
                              .toString()
                              .split(' ')[0]
                              .isEmpty) {
                            print('Passing Date');
                          } else if (selectedScore== null) {
                            print('Scored or Bands');
                          } else if (selectedWhatucleared!.isEmpty ) {
                            print('Have you Cleared');
                          } else {
                            print("start -----------------------");
                            uploadData();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AbroadStatus()),
                            );
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.isSubmitted,
    required this.context,
    required this.controller,
    required this.labelText, this.words,
  }) : super(key: key);

  final bool isSubmitted;
  final BuildContext context;
  final TextEditingController? controller;
  final TextCapitalization? words;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        style: const TextStyle(
          color: Color(0xff00235a),
        ),
        controller: controller,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          errorText: (isSubmitted == true && controller!.text.isEmpty)
              ? "Please fill field"
              : null,
          suffixIcon: (isSubmitted == true && controller!.text.isEmpty)
              ? const Icon(Icons.error_outline)
              : null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffff5275),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

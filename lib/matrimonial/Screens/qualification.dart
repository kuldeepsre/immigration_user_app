import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
import 'package:immigration/matrimonial/Screens/family.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/properties_details.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class Qualification extends StatefulWidget {
  const Qualification({Key? key}) : super(key: key);

  @override
  _QualificationState createState() => _QualificationState();
}

class _QualificationState extends State<Qualification> {
  List <String>? highQualification =['Matric','+2','Bachelors','Postgraduate','Certificate','Diploma'];
  List<String>? grade =['A+','A','B+','B','C+','C','D','E','F'];
  List<String>? passingYear =['2022','2021','2020','2019','2018','2017','2016','2015','2014','2013','2012','2011','2010','2009',' 2009 <  '];
  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();
  TextEditingController nameOfUniversityController = TextEditingController();
   String? selectedHighQualification;
   String? selectedGrade;
   String? selectedPassingYear;

  uploadData()async{
    _postFunction.postQualification({
       "mId": '0123',
      "highestQualification":selectedHighQualification,
      "universityName":nameOfUniversityController.text,
      "percentageGrade":selectedGrade,
      "passingYear":selectedPassingYear,
    });
  }
  String? selectedValue;
  bool isSubmitted=false;

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
              MaterialPageRoute(builder: (context) => const Family()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Family()),
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
                children:  [
                  const Text('Qualification Information',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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
                              'Highest Qualification',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: highQualification!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedHighQualification = e;
                                  });
                                  print(selectedHighQualification);
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
                                        color: (e == selectedHighQualification)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedHighQualification)
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
                  CustomTextField(isSubmitted: isSubmitted, context: context, controller: nameOfUniversityController, labelText: 'Name of the University or Institute '),
                 // CustomTextField(isSubmitted: isSubmitted, context: context, controller: PercentageGradeController, labelText: 'Percentage / Grade   '),
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
                              'Passing  Grade',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: grade!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedGrade = e;
                                  });
                                  print(selectedGrade);
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
                                        color: (e == selectedGrade)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedGrade)
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
                              'Passing  Year',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: passingYear!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedPassingYear = e;
                                  });
                                  print(selectedPassingYear);
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
                                        color: (e == selectedPassingYear)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedPassingYear)
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
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xffff5275),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: ()async {
                          if (selectedPassingYear== null) {
                            print("Passing years");
                          } else  if (nameOfUniversityController.text.isEmpty ||
                              nameOfUniversityController.text.length < 2) {
                            print("University Name");
                          } else  if (selectedHighQualification!.isEmpty) {
                            print("Highest qualification");
                          } else  if (selectedGrade== null) {
                            print("Percentage or Grade");
                          } else {
                          uploadData();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Properties()),
                          ); }
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
                      color: Colors.black,
                    ),
                    controller: controller,
                    textCapitalization: TextCapitalization.words,
                    decoration:   InputDecoration(
                      errorText:(isSubmitted == true && controller!.text.isEmpty) ? "Please fill field":null,
                      suffixIcon:(isSubmitted == true && controller!.text.isEmpty) ?  const Icon(Icons.error_outline,color: Colors.red,):null,
                      border:  const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder:  const OutlineInputBorder(
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

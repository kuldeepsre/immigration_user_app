import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immigration/Models/pr_score_model.dart';
import 'package:immigration/constants.dart';
import 'package:status_alert/status_alert.dart';
import 'package:http/http.dart' as http;

import '../SizeConfig.dart';
import 'JobScreen.dart';

class PRScore extends StatefulWidget{

    @Overlay()
_PRScore createState()=>new _PRScore();


}
class _PRScore extends State<PRScore> {
  TextEditingController? nameController = new TextEditingController();

  TextEditingController? fatherController=new TextEditingController();
  TextEditingController? addressController=new TextEditingController();
  TextEditingController? cityController=new TextEditingController();
  TextEditingController? detailController=new TextEditingController();
  TextEditingController? mobileController=new TextEditingController();
  TextEditingController? applyForController=new TextEditingController();
  TextEditingController? emailController=new TextEditingController();
  TextEditingController? cityCourseController=new TextEditingController();
  TextEditingController? levelController=new TextEditingController();
  TextEditingController? fieldOfStudyController=new TextEditingController();
  TextEditingController? passingYearController=new TextEditingController();
  TextEditingController? percentageController=new TextEditingController();
  TextEditingController? paasportNoController=new TextEditingController();
  TextEditingController? boardUniversityController=new TextEditingController();
  TextEditingController? aadharNoController=new TextEditingController();
  TextEditingController? testNameController=new TextEditingController();
  TextEditingController? listeningController=new TextEditingController();
  TextEditingController? readingController=new TextEditingController();
  TextEditingController? writingController=new TextEditingController();
  TextEditingController? speakingController=new TextEditingController();
  TextEditingController? overallBandController=new TextEditingController();
  TextEditingController? companyNameController=new TextEditingController();
  TextEditingController? designationController=new TextEditingController();
  TextEditingController? fromController=new TextEditingController();
  TextEditingController? toController=new TextEditingController();
  TextEditingController? travelHistoryController=new TextEditingController();
  TextEditingController? anyRefusalController=new TextEditingController();
  TextEditingController? whenWhyController=new TextEditingController();
  TextEditingController? relativeAbroadController=new TextEditingController();
  TextEditingController? relativeAddressController=new TextEditingController();
  TextEditingController? finanicalController=new TextEditingController();
  TextEditingController? fatherOccupationController=new TextEditingController();
  TextEditingController? motherOccupationController=new TextEditingController();
  TextEditingController? familyBackgroundController=new TextEditingController();

  var _image;

  // PRScore({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool  loading = false;
    submit(data) async {
      PrScoreModel model=new PrScoreModel(
          nameController!.text,
          fatherController!.text,
      addressController!.text,
      cityController!.text,
      detailController!.text,
      mobileController!.text,
      applyForController!.text,
      emailController!.text,
      cityCourseController!.text,
      levelController!.text,
      fieldOfStudyController!.text,
      passingYearController!.text,
      percentageController!.text,
      paasportNoController!.text,
      boardUniversityController!.text,
      aadharNoController!.text,
      testNameController!.text,
      listeningController!.text,
      readingController!.text,
      writingController!.text,
      speakingController!.text,
      overallBandController!.text,
      companyNameController!.text,
      designationController!.text,
      fromController!.text,
      toController!.text,
      travelHistoryController!.text,
      anyRefusalController!.text,
      whenWhyController!.text,
      relativeAbroadController!.text,
      relativeAddressController!.text,
      finanicalController!.text,
      fatherOccupationController!.text,
      motherOccupationController!.text,
      familyBackgroundController!.text, );
      var res = await http.post(
          Uri.parse(
              "https://frozen-savannah-16893.herokuapp.com/User/luggagePost"),
          body: json.encode(model.toJson()),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });

      if (res.statusCode == 200) {
        print("Luggage Post Success fully complete");
        setState(() {
          loading = false;
          StatusAlert.show(
            context,
            duration: Duration(seconds: 3),
            title: 'Done',
            subtitle: '',
            configuration: IconConfiguration(icon: Icons.done),
          );
          Timer(Duration(seconds: 2), () => {Navigator.pop(context)});
        });
      } else {
        print("Luggage Post failed fully complete${res.body}");
        setState(() {
          loading = false;
          StatusAlert.show(
            context,
            duration: Duration(seconds: 3),
            title: 'Error',
            subtitle: '',
            configuration: IconConfiguration(icon: Icons.error),
          );
          Timer(Duration(seconds: 2), () => {Navigator.pop(context)});
        });
      }
    }  SizeConfig().init(context);
    
    double height = MediaQuery.of(context).size.height;
    var testDateController=new TextEditingController();
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: [
         Container(
             width: MediaQuery.of(context).size.width,
             alignment: Alignment.center,
             child: Text("PR Score",
               style: TextStyle(
                   fontSize: SizeConfig.screenHeight! / 30,
                   fontWeight: FontWeight.bold,
                   color: kBlueColor),
             )),
          textfield(context, nameController!, 'Name', [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, fatherController!, "Father name", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, addressController!, "Address", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, cityController!, "City", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, mobileController!, "Mobile Number", [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ]),
          textfield(context, applyForController!, "Apply for", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, emailController!, "Email Address", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, cityCourseController!, "City/Course", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, levelController!, "Level", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, fieldOfStudyController!, "Field of Study", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, passingYearController!, "Passing Year", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, percentageController!, "Percentage", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, boardUniversityController!, "Board/University", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, paasportNoController!, "Passport Number", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, aadharNoController!, "Aadhar Number", [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ]),
          Text('Entry Level Exam'),
          textfield(context, testNameController!, "Test Name", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, testDateController, "Test Date", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, testNameController!, "Test Name", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, listeningController!, "Listening", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, readingController!, "Reading", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, writingController!, "Writing", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, speakingController!, "Speaking", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, overallBandController!, "Overall Band", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, testNameController!, "Test Name", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          Text("Work Experience"),
          textfield(context, companyNameController!, "Company Name", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, designationController!, "Designation", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, fromController!, "From", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, toController!, "To", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, travelHistoryController!, "Travel History", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, anyRefusalController!, "Any Refusal", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, whenWhyController!, "When/Why", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, relativeAbroadController!, "Any Relative Abroad", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(
              context, relativeAddressController!, "Relation and Address", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, finanicalController!, "Financial", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, fatherOccupationController!, "Father Occupation", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, motherOccupationController!, "Mother Occupation", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, familyBackgroundController!, "Family Background", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
          textfield(context, detailController!, "Detail", [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          ]),
            Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text('Upload you Image',
                                   style: TextStyle(
                                       fontSize: 18,
                                       color: kBlueColor,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                             ),
                      Card(
                        margin: EdgeInsets.all(10),
                        child: _image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: kBlueColor, width: 0.8),
                              borderRadius: BorderRadius.circular(3)),

                          width: 100,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            size: 70,
                            color: kBlueColor,
                          ),
                        ),
                      ),
        ],
      ),
    );
  }

  Widget textfield(BuildContext context, TextEditingController controller,
      String hint, var input) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,textCapitalization: TextCapitalization.words,
        inputFormatters: input,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15, bottom: 6, left: 10),
            border: const OutlineInputBorder(),
            labelText: hint),
      ),
    );
  }
}

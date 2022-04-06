import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/frachisepost.dart';
import 'package:status_alert/status_alert.dart';
import 'package:http_parser/http_parser.dart';
import '../SizeConfig.dart';
import '../api_config.dart';
import '../constants.dart';

class Franchise extends StatefulWidget {
  const Franchise({Key? key}) : super(key: key);

  @override
  _FranchiseState createState() => _FranchiseState();
}

class _FranchiseState extends State<Franchise> {
  bool loading=false;
  var _image;
  uploadImage() async {
    Dio dio=new Dio();
    String fileName = _image!.path.split('.').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(_image!.path,
          contentType: MediaType("image", fileName))
    });
    return await dio
        .postUri(Uri.parse(ApiConfig.BASE_URL + "User/upload"), data: formData)
        .then((value) {
      // if (response!.statusCode != 200) {

      // }

      if (value.statusCode == 200) {
        print(value.data);
        setState(() {
          loading=true;
          submit(value.data);
          // statuscode = value.statusCode!;
          // imgUrl = value.data;
        });
      }
    });
  }Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      File file = new File(image!.path);
      _image = file;
      print("select image"+_image.toString());
    });
  }
  var interestedIn = [ "IELTS",
    "Passport",
    "Study Visa",
    "Education Loan",
    "Air Ticket",
    "Travel Insurance",
    "Money Exchange",
    "Transportation",
    "Luggage Adjustment",
    "Accommodation at Abraod",
    "Jobs at Abroad",
    "Tour Travel",
    "Work Permit",
    "Permanent Residence",
    "Tourism & Business Visa",
    "Events",
    "Job requirements",
    "International Courier",
    "Legal Advisor",
    "Online IELTS Classes",
    "Check Your Score"];
  var areaType = ["Commercial", "Residential", "SCO", "Booth", "Plot"];
  var area = ["Commercial", "Residential", "SCO", "Booth", "Plot"];
  var floorNo = [ "Ground Floor",
    "First Floor",
    "Second Floor",
    "Third Floor",
    "Fourth Floor",
    "Sixth Floor",
    "Other"];
  TextEditingController interestedinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController totalAreaController = TextEditingController();
  TextEditingController floorAreaController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController adharCardController = TextEditingController();
  TextEditingController PanCardController = TextEditingController();
  TextEditingController ReadyToInvestController = TextEditingController();

  var dropdownValue;

  String? selectedInterestedIn;

  String? selectedAreaType;

  String? floorAreaSelected;

  submit(data) async {
    FranchisePost franchisePost = new FranchisePost(
        uId: FirebaseAuth.instance.currentUser!.uid,
        name:nameController.text ,
        interested: selectedInterestedIn!,
        areaType: selectedAreaType!,
        phoneNo: phonenoController.text,
        qualification: qualificationController.text,
        totalArea: totalAreaController.text,
        floorArea: floorAreaSelected!,
        aadharCard: adharCardController.text,
        panCard: PanCardController.text,
        readyToInvest: ReadyToInvestController.text,
        postImage: data
    );

    var res = await http.post(
        Uri.parse(
            "https://frozen-savannah-16893.herokuapp.com/User/franchisePost"),
        body: json.encode(franchisePost.toJson()), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    if (res.statusCode == 200) {
      print("Luggage Post Success fully complete");
      setState(() {
        loading=false;
        StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          title: 'Done',
          subtitle: '',
          configuration: IconConfiguration(icon: Icons.done),
        );
        Timer(Duration(seconds: 2),()=>{
          Navigator.pop(context)
        });
      });
    } else {
      print("Luggage Post failed fully complete${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Immigration Adda',
          style: TextStyle(
            color: kBlueColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // textfield(context, interestedinController, 'Interested In :',
                //     [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedInterestedIn,
                        isExpanded: true,
                        elevation: 16,
                        hint: Text('Interested In'),

                        style:  TextStyle(color:kBlueColor, fontSize: 18,

                        ),
                        underline: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: kBlueColor,
                        ),
                        onChanged: (value) {
                           setState(() {
                             selectedInterestedIn = value.toString();
                          });

                        },
                        items: interestedIn.map<DropdownMenuItem<String>>((
                            String value) {
                          return DropdownMenuItem<String>
                            (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                // textfield(context, areatypeController, 'Area Type :',
                //     [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedAreaType,
                        hint: Text('Area Type'),
                        isExpanded: true,
                        elevation: 16,

                        style: TextStyle(color: kBlueColor, fontSize: 18,

                        ),
                        underline: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: kBlueColor,
                        ),
                        onChanged: (value) {
                           setState(() {
                             selectedAreaType = value.toString();
                          });
                        },
                        items: areaType.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>
                            (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                textfield(context, nameController, 'Name :',
                    [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],limit: 30),
                textfield(context, phonenoController, 'Phone Number :',
                    [ FilteringTextInputFormatter.allow(RegExp("[0-9]")),],limit: 10),
                textfield(context, qualificationController, 'Qualification :',
                    [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                textfield(context, totalAreaController, 'Total Area :',
                    [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                // textfield(context, floorAreaController, 'Floor Area :',
                //     [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: floorAreaSelected,
                        isExpanded: true,
                        hint: Text('Floor Area'),
                        elevation: 16,

                        style: TextStyle(color: kBlueColor, fontSize: 18,

                        ),
                        underline: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: kBlueColor,
                        ),
                        onChanged: (value) {
                           setState(() {
                             floorAreaSelected = value.toString();
                          });
                        },
                        items: floorNo.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>
                            (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: floorAreaSelected,
                        isExpanded: true,
                        hint: Text('Area'),
                        elevation: 16,

                        style: TextStyle(color: kBlueColor, fontSize: 18,

                        ),
                        underline: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: kBlueColor,
                        ),
                        onChanged: (value) {
                          setState(() {
                            floorAreaSelected = value.toString();
                          });
                        },
                        items: floorNo.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>
                            (
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                // textfield(context, areaController, 'Area :',
                //     [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(padding: EdgeInsets.symmetric(horizontal: 10.0),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5.0),
                //       border: Border.all(
                //           color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                //     ),
                //     child: DropdownButtonHideUnderline(
                //       child: DropdownButton<String>(
                //         value: dropdownValue,
                //         isExpanded: true,
                //         elevation: 16,
                //         hint: Text("Select Area type"),
                //
                //         style: TextStyle(color: kBlueColor, fontSize: 18,
                //
                //         ),
                //         underline: Container(
                //           width: MediaQuery
                //               .of(context)
                //               .size
                //               .width,
                //           height: 1,
                //           color: kBlueColor,
                //         ),
                //         onChanged: (value) {
                //            setState(() {
                //             dropdownValue = value.toString();
                //           });
                //         },
                //         items: area.map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>
                //             (
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   ),
                // ),
                textfield(context, adharCardController, 'Aadhar Card Number :',
                    [FilteringTextInputFormatter.allow(RegExp("[0-9]")),],limit: 12),
                textfield(context, PanCardController, 'Pan Card Number :',
                    [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),],limit: 10),
                textfield(context, ReadyToInvestController, 'Ready to invest :',
                    [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]),
                GestureDetector(
                  onTap: () {
                   getLostData();
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: _image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _image,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black45, width: 0.8),
                          borderRadius: BorderRadius.circular(3)),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        size: 70,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,

                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: TextButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: kBlueColor),
                      onPressed: () {
                        setState(() {
                          loading = true;
                          uploadImage();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.screenHeight! / 40),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            loading==true? Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              color: Colors.white10,
              child:  SpinKitCircle(
                color: kBlueColor,
                size: 50,
              ),
            ):Container()
          ],
        ),
      ),
    );
  }

  Widget textfield(BuildContext context, TextEditingController controller,
      String hint, var input,{int? limit}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        controller: controller,
        inputFormatters: input,
        maxLength:limit!=null?limit:60,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
counterText: "",
            contentPadding: const EdgeInsets.only(top: 15, bottom: 6, left: 10),
            border:OutlineInputBorder( ),
            hoverColor: kBlueColor,
            labelText: hint
        ),
      ),
    );
  }
}
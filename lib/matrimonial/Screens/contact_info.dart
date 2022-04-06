import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/family.dart';
import 'package:immigration/matrimonial/Screens/ilets_tofel_celpip.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/qualification.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class ContactInfo extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final List? interestedCounty;
  final String? dob;
  final String? height;
  final String? weight;
  final String? livingStatus;
  final String? bodyType;
  final String? complexion;
  final String? maritalStatus;
  final String? noOfChildrens;
  final String? whereAreChildren;
  final String? diet;
  final String? drinking;
  final String? smoking;
  final String? presentLiving;
  final String? permanentLivingIn;
  final String? motherTongue;
  final String? ieltsTofel;
  final String? age;
  final String? gender;

  const ContactInfo({
    Key? key,
    this.firstName,
    this.lastName,
    this.age,
    this.dob,
    this.height,
    this.weight,
    this.bodyType,
    this.complexion,
    this.maritalStatus,
    this.noOfChildrens,
    this.whereAreChildren,
    this.diet,
    this.drinking,
    this.smoking,
    this.presentLiving,
    this.permanentLivingIn,
    this.motherTongue,
    this.ieltsTofel,
    this.livingStatus,
    this.interestedCounty,
    this.gender,
  }) : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  List<String>? passport = [
    'Ordinary Passport',
    'Official Passport',
    'Diplomatic Passport',
    'Emergency Passport',
    'Family Passport',
    'Collective Passport',
    'None'
  ];

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController alternativePhoneNumberController =
      TextEditingController();
  //TextEditingController passportNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController whatsaapNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();
  String? selectedPassport = '';

  uploadData() {
    _postFunction.postPersonalInfo({
      "mId": '0123',
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "dob": widget.dob,
      'age': widget.age,
      "height": widget.height,
      "weight": widget.weight,
      "bodyType": widget.bodyType,
      "complexion": widget.complexion,
      "maritalStatus": widget.maritalStatus,
      "noOfChildren": widget.noOfChildrens,
      "whereAreTheChildren": widget.whereAreChildren,
      "diet": widget.diet,
      "drinking": widget.drinking,
      "smoking": widget.smoking,
      "presentLivingIn": widget.presentLiving,
      "permanentLivingIn": widget.permanentLivingIn,
      "motherTongue": widget.motherTongue,
      "ieltsTofel": widget.ieltsTofel,
      "phoneNo": phoneNumberController.text,
      "alternativePhoneNo": alternativePhoneNumberController.text,
      "whatsAppNo": whatsaapNumberController.text,
      "emailId": emailIdController.text,
      "livingStatus": widget.livingStatus,
      // "passportNo": passportNumberController.text,
      "address": addressController.text,
    });
  }

  String? selectedValue;
  bool? isSubmitted = false;

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
              MaterialPageRoute(builder: (context) => const PersonalInfo()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PersonalInfo()),
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
                    'Contact Information',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomField(
                      isSubmitted: isSubmitted!,
                      controller: phoneNumberController,
                      labelText: 'Phone Number'),
                  CustomField(
                      isSubmitted: isSubmitted!,
                      controller: alternativePhoneNumberController,
                      labelText: 'Alternative Phone Number'),
                  CustomField(
                      isSubmitted: isSubmitted!,
                      controller: whatsaapNumberController,
                      labelText: 'Whatsapp Number'),
                  CustomField(
                      isSubmitted: isSubmitted!,
                      controller: emailIdController,
                      labelText: 'Email Id'),
                  CustomField(
                      isSubmitted: isSubmitted!,
                      controller: addressController,
                      labelText: 'City'),
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
                          if (whatsaapNumberController.text.isEmpty ||
                              whatsaapNumberController.text.length < 9) {
                            print('Whatsapp Number');
                          } else if (phoneNumberController.text.isEmpty ||
                              phoneNumberController.text.length < 9) {
                            print('Phone Number');
                          } else if (alternativePhoneNumberController
                                  .text.isEmpty ||
                              alternativePhoneNumberController.text.length <
                                  9) {
                            print('Alternative Phone Number');
                          } else if (addressController.text.isEmpty ||
                              addressController.text.length < 4) {
                            print('Address');
                          } else {
                            print("start -----------------------");
                            uploadData();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Family(),
                              ),
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

class CustomField extends StatelessWidget {
  CustomField({
    Key? key,
    required this.isSubmitted,
    required this.controller,
    required this.labelText,
    this.words,
  }) : super(key: key);

  final bool? isSubmitted;
  final TextEditingController? controller;
  final String? labelText;
  final TextCapitalization? words;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(
          color: Color(0xff00235a),
        ),
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

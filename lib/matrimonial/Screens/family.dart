import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/qualification.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class Family extends StatefulWidget {
  const Family({Key? key}) : super(key: key);

  @override
  _FamilyState createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  List<String>? country = ['India', 'Abroad', 'None'];
  List<String>? status = ['Working', 'Retired', 'NRI', 'Passed Away'];
  List<String>? motherStatus = ['Home Maker', 'Working', 'Retired', 'NRI', 'Passed Away'];
  List<String>? livingstatus = [
    'Citizenship',
    'Tourist Visa',
    "Work Permit",
    "Permanent Resident",
    "Study Visa",
    "None",
  ];

  List<String>? child = [
    'None',
    '1',
    "2",
    "3",
    "More",
  ];

  List<String>? religion = [
    'Buddhism',
    'Christianity',
    'Hinduism',
    'Islam',
    'Jainism',
    'Sikhism',
    'Other'
  ];

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  //TextEditingController religionController = TextEditingController();
  TextEditingController sisterCountryStatusController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController subcastController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherStatusController = TextEditingController();

  TextEditingController fatherCountryStatusController =TextEditingController();
  TextEditingController fatherAbroadLivingStatusController =
      TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController motherStatusController = TextEditingController();
  TextEditingController motherCountryStatusController = TextEditingController();
  TextEditingController motherLivingStatusController = TextEditingController();
  TextEditingController noOfBrotherController = TextEditingController();
  TextEditingController brotherCountryStatusController =
      TextEditingController();
  TextEditingController brotherLivingStatusController = TextEditingController();
  TextEditingController noOfSisterController = TextEditingController();
  TextEditingController sisterLivingStatusController = TextEditingController();

  String? religionSelectedItem;
  String? selectedBrotherAbroadStatus;
  String? selectFatherCountryStatus;
  String? selectedFatherAbroadStatus;
  String? selectedMotherAbroadStatus;
  String? selectedMothercountryStatus;
  String? selectedMotherStatus;
  String? selectedSisterAbroadStatus;
  String? selectedSisterCountryStatus;
  String? selectedBrotherCountryStatus;
  String? selectedFatherStatus;
  String? selectedNoSister;
  String? selectedFatherLivingStatus;

  uploadData() async {
    _postFunction.postFamily({
      "mId": '0123',
      "fatherName": fatherNameController.text,
      "fatherStatus": selectedFatherStatus,
      "fatherCountryStatus": selectFatherCountryStatus,
      "fatherLivingStatus": selectedFatherLivingStatus,
      "motherName": motherNameController.text,
      "motherStatus": selectedMotherStatus,
      "motherCountryStatus": selectedMothercountryStatus,
      "motherLivingStatus": selectedMotherAbroadStatus,
      "noOfBrother": selectedChild,
      "brotherCountryStatus": selectedBrotherCountryStatus,
      "brotherLivingStatus": selectedBrotherAbroadStatus,
      "noOfSister": selectedNoSister,
      "sisterCountryStatus": selectedSisterCountryStatus,
      "sisterLivingStatus": selectedSisterAbroadStatus,
      "cast": castController.text,
      "religion": selectedRelegion,
      "subCast": subcastController.text,
    });
  }

  String selectedLivingStatusValue = '';
  String selectedRelegion = '';
  String selectedCountry = '';
  String selectedChild = '';
  String selectedStatus = '';
  String? selectedValue;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ContactInfo()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ContactInfo()),
              );
            },
            child: const Center(
              child: Text(
                'Immigration Adda',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Family & Cast information',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'Religion',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: religion!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedRelegion = e;
                                    });
                                    print(selectedRelegion);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e == selectedRelegion)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedRelegion)
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
                CustomTextField(
                    isSubmitted: isSubmitted,
                    context: context,
                    controller: castController,
                    labelText: 'Cast'),
                CustomTextField(
                    isSubmitted: isSubmitted,
                    context: context,
                    controller: subcastController,
                    labelText: "Subcast "),
                CustomTextField(
                    isSubmitted: isSubmitted,
                    context: context,
                    controller: fatherNameController,
                    labelText: "Father Name "),
                //CustomTextField(isSubmitted: isSubmitted, context: context, controller: selectedFatherStatus, labelText: "Father Status "),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'Father Status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: status!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedFatherStatus = e;
                                    });
                                    print(selectedFatherStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e == selectedFatherStatus)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedFatherStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'They are living in India or Abroad',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: country!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectFatherCountryStatus = e;
                                    });
                                    print(selectFatherCountryStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectFatherCountryStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                      selectFatherCountryStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'If Abroad, Then there living status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: livingstatus!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedFatherLivingStatus = e;
                                    });
                                    print(selectedFatherLivingStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedFatherLivingStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedFatherLivingStatus)
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
                CustomTextField(
                    isSubmitted: isSubmitted,
                    context: context,
                    controller: motherNameController,
                    labelText: "Mother Name"),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'Mother Status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: motherStatus!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedMotherStatus = e;
                                    });
                                    print(selectedMotherStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e == selectedMotherStatus)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedMotherStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'They are living in India or Abroad',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: country!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedMothercountryStatus = e;
                                    });
                                    print(selectedMothercountryStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedMothercountryStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedMothercountryStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'If Abroad, Then there living status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: livingstatus!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedMotherAbroadStatus = e;
                                    });
                                    print(selectedMotherAbroadStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedMotherAbroadStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedMotherAbroadStatus)
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

                //  CustomTextField(isSubmitted: isSubmitted, context: context, controller: noOfBrotherController, labelText: "Number of brother  "),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'Number of Brother',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: child!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedChild = e;
                                    });
                                    print(selectedChild);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e == selectedChild)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedChild)
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

                //  CustomTextField(isSubmitted: isSubmitted, context: context, controller: brotherCountryStatusController, labelText: "They are living in India / Abroad "),

                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'They are living in India or Abroad',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: country!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedBrotherCountryStatus = e;
                                    });
                                    print(selectedBrotherCountryStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e ==
                                                  selectedBrotherCountryStatus)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedBrotherCountryStatus)
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

                //CustomTextField(isSubmitted: isSubmitted, context: context, controller: brotherLivingStatusController, labelText: "If Abroad, Then there living status "),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'If Abroad, Then there living status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: livingstatus!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedBrotherAbroadStatus = e;
                                    });
                                    print(selectedBrotherAbroadStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedBrotherAbroadStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedBrotherAbroadStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'Number of Sister',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: child!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedNoSister = e;
                                    });
                                    print(selectedNoSister);
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
                                              width: 0.19, color: Colors.grey),
                                          color: (e == selectedNoSister)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedNoSister)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'They are living in India or Abroad',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: country!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedSisterCountryStatus = e;
                                    });
                                    print(selectedSisterCountryStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedSisterCountryStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedSisterCountryStatus)
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(3)),

                    //color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            'If Abroad, Then there living status',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: livingstatus!
                              .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedSisterAbroadStatus = e;
                                    });
                                    print(selectedSisterAbroadStatus);
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
                                              width: 0.19, color: Colors.grey),
                                          color:
                                              (e == selectedSisterAbroadStatus)
                                                  ? kRedColor
                                                  : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e ==
                                                          selectedSisterAbroadStatus)
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
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 50, width: 280,
                //color: Color(0xff0d47a1),
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
                  onPressed: () {
                    if (selectedMotherAbroadStatus == null ) {
                      print("Mother Abroad living Status");
                    } else if (motherNameController.text.isEmpty ) {
                      print("Mother name");
                    } else if (selectedMothercountryStatus== null) {
                      print("Mother living in India or Abroad");
                    } else if (selectedMotherStatus== null) {
                      print("Mother Status");
                    } else if (fatherNameController.text.isEmpty) {
                      print("Father name");
                    } else if (selectFatherCountryStatus== null) {
                      print("Father Abroad living status");
                    } else if (selectedFatherStatus== null) {
                      print("Father status");
                    } else if (selectedChild.isEmpty) {
                      print("Number of Brother");
                    } else if (selectedBrotherAbroadStatus== null) {
                      print("Brother living status");
                    } else if (selectedBrotherCountryStatus== null) {
                      print("Brother living in India or Abroad");
                    } else if (selectedSisterAbroadStatus== null) {
                      print("Sister living status");
                    } else if (selectedSisterCountryStatus== null) {
                      print("Sister living in India or Abroad");
                    } else if (selectedNoSister== null) {
                      print("Number of sister");
                    } else {
                      print("start -----------------------");

                      uploadData();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Qualification()),
                      );
                    }
                  },
                  child: const Text(
                    "Continue",
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.isSubmitted,
    required this.context,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  final bool isSubmitted;
  final BuildContext context;
  final TextEditingController? controller;
  final String? labelText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: TextField(
        style: const TextStyle(
          color: Color(0xff00235a),
        ),
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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

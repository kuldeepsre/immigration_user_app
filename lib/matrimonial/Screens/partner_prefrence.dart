import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/abroad.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';
import 'package:immigration/matrimonial/model/Post%20Data/partner_prefference_details.dart';
import 'package:immigration/matrimonial/model/Post%20Data/personal_info_model.dart';
import 'package:immigration/matrimonial/multi_select.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PartnerPrefrence extends StatefulWidget {
  const PartnerPrefrence({Key? key}) : super(key: key);

  @override
  _PartnerPrefrenceState createState() => _PartnerPrefrenceState();
}

class _PartnerPrefrenceState extends State<PartnerPrefrence> {
  List<String> selectedCountries = [];
  List<String>? livingstatus = [
    'Citizenship',
    'Tourist Visa',
    "Work Permit",
    "Permanent Resident",
    "Study Visa",
    'Dose not matter',
  ];
  List<String>? highQualification = [
    'Matric',
    '+2',
    'Bachelors',
    'Postgraduate',
    'Certificate',
    'Diploma',
    'Doesnot matter'
  ];
  List<String>? ielts = [
    'IELTS',
    'TOFEL',
    'CELPIP',
    'PTE',
    'CD-IELTS',
    'NAATI',
    'CAEL',
    'Does not matter '
  ];
  List<String>? wherechild = ['Live together', 'Separate', 'None'];
  List<String>? nochild = ['Yes', 'No', 'Dose not matter'];
  List<String>? bodytype = [
    'slim',
    'Tone',
    'Muscular',
    'Stocky',
    'Large',
    'Average',
    'Dose not matter'
  ];
  List<String>? complexion = [
    'Fair skin',
    "Medium skin",
    "Olive skin",
    "Brown skin",
    "Black skin",
    'Dose not matter'
  ];
  List drinkingList = ["Yes", "No", "Occasionally Drink", 'Dose not matter'];
  List smoking = ["Yes", "No", "Occasionally Smoking", 'Dose not matter'];
  List ieltsTofelList = ["IELTS", "TOFEL", "No"];
  List work = ['Working', 'Non Working', 'Does not matter'];

  List<String>? maritalStatus = [
    'Single',
    'Widow / Widower',
    'Divorced',
    'Dose not matter'
  ];
  List<String>? countries = [
    'Canada',
    'USA',
    'Australia',
    'New Zealand',
    'U.K',
    'Germany',
    'France',
    'Italy',
    'Norway',
    'Russia',
    'Austria',
    'Portugal',
    'China',
    'Japan',
    'Pakistan',
    'Saudi arab',
    'UAE',
    'Singapore',
    'Malaysia',
    'Fizi',
    'Brazil',
    'Argentina',
    'Europe',
    'A Gulf Countries',
    'Asia',
    'Africa',
    'South America',
    'Nepal',
    'Sri Lanka',
    'Other'
  ];
  List<String>? motherTongueList = [
    "Assamese",
    "Bengali",
    "Bodo",
    "Dogri",
    "Gujarati",
    "Hindi",
    "Kannada",
    "Konkani",
    "Malayal",
    "Manipuri",
    "Marathi",
    "Nepali",
    "Odia",
    "Punjabi",
    "Sanskrit",
    "Santali",
    "Sindhi",
    "Tamil",
    "Telugu",
    "Urdu",
    'Does not matter'
  ];
  List<String> selectedMotherTongue = [''];
  List<String>? marriagewith = ['Indian', 'Foreigner', 'Does not matter'];

  List<String> dietList = [
    "Veg",
    "Non-Veg",
    "Occasionally Non-Veg",
    "Eggetarian",
    "Jain",
    "Vegan",
    'Dose not matter'
  ];
  final PartnerPreferenceModel _partnerPreferenceModel =
      PartnerPreferenceModel();

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  String selectedLivingStatusValue = '';
  String selectedBodyType = '';
  String selectedNoChild = '';
  String selectedComplexionType = '';
  String selectedMaritalStatus = '';
  String selectedDiet = "";
  String selectedDrinking = '';
  String selectedSmoking = '';
  String selectedWherechild = '';
  String? selectedMarriageWith;
  String? selectedWork;
  String? selectedHighQualification;
  String? selectedCountry;
  String? selectedIelts;

  uploadData() async {
    _postFunction.postPartnerDetails({
      "mId": "0123",
      "PreferredCountry": selectedCountries.toString(),
      "PreferredLivingStatus": selectedLivingStatusValue.toString(),
      "PreferredWorkingStatus": selectedWork.toString(),
      "PreferredAge": {
        "minAge":_age.start.toString(),
        "maxAge":_age.end.toString(),
      },
      "PreferredHeight": {
        "minHeight":_height.start.toString(),
        "maxHeight":_height.end.toString(),
      },
      "PreferredHighestQualification": selectedHighQualification.toString(),
      "PreferredMaritalStatus": selectedMaritalStatus.toString(),
      "PreferredBodyType": selectedBodyType.toString(),
      "PreferredComplexion": selectedComplexionType.toString(),
      "PreferredDiet": selectedDiet.toString(),
      "PreferredDrinking": selectedDrinking.toString(),
      "PreferredSmoking": selectedSmoking.toString(),
      "PreferredMotherTounge": selectedMotherTongue.toString(),
    });
  }

  String? selectedValue;
  bool isSubmitted = false;
  DateTime selectedDate = DateTime.now();
  int ageMin=18;
  int ageMax=80;
  int heightMin=45;
  int heightMax=80;

  pickDate() {
    DatePickerDialog(
        // currentDate: DateTime.now(),
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 70000)),
        lastDate: DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1949),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      print(selectedDate);
    }
  }

  SfRangeValues _age = SfRangeValues(20, 80);
  SfRangeValues _height = SfRangeValues(45, 80);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AbroadStatus()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AbroadStatus()),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Partner prefrence',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                          'Preferred Country Name',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: countries!
                            .map((e) => InkWell(
                                onTap: () {
                                
                                  if (selectedCountries.contains(e)) {
                                    setState(() {
                                      selectedCountries.removeWhere(
                                          (element) => element == e);
                                    });
                                    print(selectedCountries);
                                  } else {
                                    setState(() {
                                      selectedCountries.add(e);
                                      //   selectedWheeler = e! as List<String>;
                                    });
                                    print(selectedCountries);
                                  }
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
                                        color: (selectedCountries.contains(e) ==
                                                true)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (selectedCountries
                                                            .contains(e) ==
                                                        true)
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
                          'Preferred Nationality',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: marriagewith!
                            .map((e) => InkWell(
                                onTap: () {
                                

                                  setState(() {
                                    selectedMarriageWith = e;
                                  });
                                  print(selectedMarriageWith);
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
                                        color: (e == selectedMarriageWith)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color:
                                                    (e == selectedMarriageWith)
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
                          'Preferred living Status',
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
                                  

                                  setState(() {
                                    selectedLivingStatusValue = e;
                                  });
                                  print(selectedLivingStatusValue);
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
                                        color: (e == selectedLivingStatusValue)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedLivingStatusValue)
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
                          'Preferred Working status',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: work
                            .map((e) => InkWell(
                                onTap: () {
                                 

                                  setState(() {
                                    selectedWork = e;
                                  });
                                  print(selectedWork);
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
                                        color: (e == selectedWork)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedWork)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Ielts / Tofel',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: ielts!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIelts = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedIelts)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedIelts)
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
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Preferred Age',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: SfRangeSlider(
                          min: 18,
                          max: 80,
                          activeColor: kRedColor,
                          inactiveColor: Colors.grey,
                          values: _age,
                          showTicks: true,
                          enableTooltip: true,
                          showLabels: true,
                          minorTicksPerInterval: 1,
                          onChanged: (SfRangeValues values) {
                            print('MIN: ${values.start}, min: ${values.end}');
                            setState(() {
                              _age = values;
                              ageMin= _age.start.toInt();
                              ageMax= _age.end.toInt();
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:16.0),
                            child: Card(
                              shape: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(ageMin.toString() + " Years",
                              style: const TextStyle(
                                fontSize:18,
                              ),
                              ),
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:16.0),
                            child: Card(
                              shape: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(ageMax.toString() + " Years",
                                style: const TextStyle(
                                  fontSize:18,
                                ),),
                            ),),
                          ),
                        ],
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
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Preferred Height',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SfRangeSlider(
                          min: 45,
                          max: 80 ,
                          activeColor: kRedColor,
                          inactiveColor: Colors.grey,
                          values: _height,
                          showTicks: true,
                          enableTooltip: true,
                          showLabels: true,
                          minorTicksPerInterval: 1,
                          onChanged: (SfRangeValues values) {
                            print('MIN: ${values.start}, min: ${values.end}');
                            setState(() {
                              _height = values;
                              heightMin= _height.start.toInt();
                              heightMax= _height.end.toInt();
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:16.0),
                            child: Card(
                              shape: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(heightMin.toString()+" Inches",
                                  style: const TextStyle(
                                    fontSize:18,
                                  ),
                                ),
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:16.0),
                            child: Card(
                              shape: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(heightMax.toString()+" Inches",
                                  style: const TextStyle(
                                    fontSize:18,
                                  ),),
                              ),),
                          ),
                        ],
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Preferred highest qualification',
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
                                  setState(() {
                                    selectedHighQualification = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
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
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedHighQualification)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Preferred marital status',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: maritalStatus!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMaritalStatus = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedMaritalStatus)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    (e == selectedMaritalStatus)
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
                          'Preferred body type',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: bodytype!
                            .map((e) => InkWell(
                                onTap: () {
                                

                                  setState(() {
                                    selectedBodyType = e;
                                  });
                                  print(selectedBodyType);
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
                                        color: (e == selectedBodyType)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedBodyType)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Preferred complexion',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: complexion!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedComplexionType = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedComplexionType)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedComplexionType)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Preferred Diet',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: dietList
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedDiet = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedDiet)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedDiet)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Drinking',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: drinkingList
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedDrinking = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedDrinking)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedDrinking)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Smoking',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: smoking
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedSmoking = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedSmoking)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedSmoking)
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Preferred Mother Tongue',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: motherTongueList!
                            .map((e) => InkWell(
                                onTap: () {
                                
                                  if (selectedMotherTongue.contains(e)) {
                                    setState(() {
                                      selectedMotherTongue.removeWhere(
                                          (element) => element == e);
                                    });
                                    print(selectedMotherTongue);
                                  } else {
                                    setState(() {
                                      selectedMotherTongue.add(e);
                                  });
                                    print(selectedMotherTongue);
                                  }
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
                                        color:
                                            (selectedMotherTongue.contains(e) ==
                                                    true)
                                                ? kRedColor
                                                : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (selectedMotherTongue
                                                            .contains(e) ==
                                                        true)
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
                      setState(() {
                        isSubmitted = true;
                      });
                      if (_height.end == null && _height.start == null) {
                        print('Height');
                      } else if (selectedBodyType.isEmpty) {
                        print('BodyType');
                      } else if (_age.start == null && _age.end == null) {
                        print('Age');
                      } else if (selectedComplexionType.isEmpty) {
                        print('Complexin');
                      } else if (selectedMaritalStatus.isEmpty) {
                        print('Marital Status');
                      } else if (selectedDiet.isEmpty) {
                        print('Diet');
                      } else if (selectedSmoking.isEmpty) {
                        print('Smoking');
                      } else if (selectedDrinking.isEmpty) {
                        print('Drinking');
                      } else if (selectedMotherTongue.isEmpty) {
                        print('Mother Tongue');
                      } else if (selectedIelts == null) {
                        print('Ielts / Tofel');
                      } else if (selectedLivingStatusValue.isEmpty) {
                        print('Living status');
                      } else if (selectedWork!.isEmpty) {
                        print('Working');
                      } else if (selectedMarriageWith!.isEmpty) {
                        print('Living status');
                      } else if (selectedCountries.isEmpty) {
                        print('Country');
                      } else {
                        uploadData();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MultiImage()),
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
              // TextButton(onPressed: (){uploadData();}, child: const Text('Continue',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold
              //   ),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap ChipCard(List? list, Function()? onTap, String selected) {
    return Wrap(
      children: list!
          .map((e) => InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 90.0,
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 0.7, color: Colors.grey),
                      color: (e == selectedBodyType) ? kRedColor : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(e,
                          style: TextStyle(
                              color: (e == selectedBodyType)
                                  ? Colors.white
                                  : kRedColor)),
                    )),
              )))
          .toList(),
    );
  }
}

class CustomeTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  bool? isSubmitted;
  final TextCapitalization? words;

  CustomeTextField(
      {Key? key,
      this.onChanged,
      required this.labelText,
      required this.controller,
      this.isSubmitted,
      this.words})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          errorText: (isSubmitted == true && controller!.text.isEmpty)
              ? "Please fill field"
              : null,
          suffixIcon: (isSubmitted == true && controller!.text.isEmpty)
              ? const Icon(Icons.error_outline)
              : null,
          contentPadding: const EdgeInsets.only(top: 15, bottom: 6, left: 10),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: kRedColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kRedColor)),
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

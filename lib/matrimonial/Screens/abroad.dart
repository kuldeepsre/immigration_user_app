import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/family.dart';
import 'package:immigration/matrimonial/Screens/ilets_tofel_celpip.dart';
import 'package:immigration/matrimonial/Screens/partner_prefrence.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class AbroadStatus extends StatefulWidget {
  const AbroadStatus({Key? key}) : super(key: key);

  @override
  _AbroadStatusState createState() => _AbroadStatusState();
}

class _AbroadStatusState extends State<AbroadStatus> {

  List <String>? timeUgoAbroad =['0','1','2','3','4','5','6','7','8','9','10','10+'];
  List<String>? country=['Canada','USA','Australia','New Zealand','U.K','Germany','France','Italy','Norway',
    'Russia','Austria','Portugal','China','Japan','Pakistan','Saudi arab','UAE','Singapore','Malaysia','Fizi','Brazil',
    'Argentina','Europe','A Gulf Countries','Asia','Africa','South America',
    'Nepal','Sri Lanka','Other'];
  List<String>? whereULive =['Own','Rental','Sharing','Relative','Company guest house','Never Gone'];
  List <String>? whenWillucome =['Within 6 Months','1 year ','2 years','3 years','4 years','None'];
  List <String>? HowManyTimeuGo =['0 year','1 year','2 years','3 years','4 years','5 years','6 years','7 years','8 years','9 years','10 years','10+ years'];
  List<String>? typeOfVisa = [
    'Citizenship',
    'Tourist Visa',
    "Work Permit",
    "Permanent Resident",
    "Study Visa",
    "None",
  ];
  List<String>? yno =['Yes','No'];
  List<String>? yn =['Yes','No','May be'];
  List<String>? Rum =['Yes','No','Rarely'];
  
  
  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();
  TextEditingController howManyTimeYouGoAbroadController = TextEditingController();
  TextEditingController whereAreYouLivingInAbroadController = TextEditingController();
  TextEditingController typeOfVisaDoYouHaveController = TextEditingController();
  TextEditingController sponsorshipFromAbroadController = TextEditingController();
  TextEditingController howLongHaveBeenLivingInAbroadController  = TextEditingController();
  TextEditingController areYouMakingMoneyInAbroadController = TextEditingController();
  TextEditingController whenWillYouComeBackFromAbroadController = TextEditingController();

  String? selectedTimeUgoAbroad;

  String? selectedTypeOfVisa;

  String? selectedYn;

  String? selectedHowlonggoAbroad;

  String? selectedRuMakingMoney;

  String? selectedWhenWillUCome;

  String? selectedwhereULive;

  String? selectedCountry;

  String? selectedyno;



  uploadData()async{
    _postFunction.postAbroad({
       "mId": '0123',
      "howManyTimeYouGoAbroad": selectedTimeUgoAbroad,
      "whereAreYouLivingInAbroad": selectedwhereULive,
      "typeOfVisaDoYouHave": selectedTypeOfVisa,
      "sponsorshipFromAbroad": selectedYn,
      "doYouHaveWorkOrBusiness": selectedyno,
      "howLongHaveBeenLivingInAbroad": selectedHowlonggoAbroad,
      "areYouMakingMoneyInAbroad": selectedRuMakingMoney,
      "whenWillYouComeBackFromAbroad":selectedWhenWillUCome,
    });
  }
  String? selectedValue;
  bool isSubmitted= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const IletsTofelCelpip()),
          );},
        ),
        title:  TextButton(onPressed: (){ Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IletsTofelCelpip()),
        );},
            child: const Center(
              child: Text('Immigration Adda',
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Previous foreign history',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(

                 shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.3),borderRadius: BorderRadius.circular(3)),
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Have you ever been Abroad',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: yno!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedyno= e;
                                  });
                                  print(selectedyno);
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
                                        color: (e == selectedyno)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedyno)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'How many times you go to Abroad',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: timeUgoAbroad!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedTimeUgoAbroad = e;
                                  });
                                  print(selectedTimeUgoAbroad);
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
                                        color: (e == selectedTimeUgoAbroad)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedTimeUgoAbroad)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Which type of visa do you have ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: typeOfVisa!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedTypeOfVisa = e;
                                  });
                                  print(selectedTypeOfVisa);
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
                                        color: (e == selectedTypeOfVisa)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedTypeOfVisa)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Can you take sponsorship from Abroad ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: yn!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedYn = e;
                                  });
                                  print(selectedYn);
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
                                        color: (e == selectedYn)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedYn)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'How long have you been living in Abroad ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: HowManyTimeuGo!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedHowlonggoAbroad = e;
                                  });
                                  print(selectedHowlonggoAbroad);
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
                                        color: (e == selectedHowlonggoAbroad)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedHowlonggoAbroad)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Are you making money in Abroad ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: Rum!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedRuMakingMoney = e;
                                  });
                                  print(selectedRuMakingMoney);
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
                                        color: (e == selectedRuMakingMoney)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedRuMakingMoney)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'When will you come from Abroad ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: whenWillucome!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedWhenWillUCome = e;
                                  });
                                  print(selectedWhenWillUCome);
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
                                        color: (e == selectedWhenWillUCome)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedWhenWillUCome)
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
                      //color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              'Where are you living in Abroad ?',
                              style: TextStyle(
                                color: kRedColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: whereULive!
                                .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedwhereULive = e;
                                  });
                                  print(selectedwhereULive);
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
                                        color: (e == selectedwhereULive)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedwhereULive)
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
                  //CustomTextField(isSubmitted: isSubmitted, context: context, controller: whenWillYouComeBackFromAbroadController, labelText: 'When will you come from Abroad ?'),
                //  CustomTextField(isSubmitted: isSubmitted, context: context, controller: whereAreYouLivingInAbroadController, labelText: 'Where are you living in Abroad ?'),
                ],
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
                    if (timeUgoAbroad!.isEmpty) {
                      print("How many time you go Abroad ?");
                    } else if (typeOfVisa!.isEmpty ) {
                      print("Which type of visa do you have ?");
                    } else  if (yn!.isEmpty) {
                      print("Sponsorship from Abroad ?");
                    } else  if (Rum!.isEmpty) {
                      print("Are you making money in Abroad ?");
                    } else  if (whenWillucome!.isEmpty) {
                      print("When will you come back from Abroad ?");
                    } else  if (whereULive!.isEmpty) {
                      print("Where are you living in Abroad ?");
                    } else  if (HowManyTimeuGo!.isEmpty) {
                      print("How long you live in Abroad ?");
                    } else{
                      print("start -----------------------");
                     uploadData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PartnerPrefrence()),
                    );}
                  },
                  child:  const Text(
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
                    textCapitalization: TextCapitalization.words,
                    controller: controller,
                    decoration:  InputDecoration(
                      errorText: (isSubmitted == true && controller!.text.isEmpty) ? "Please fill field":null,
                      suffixIcon: (isSubmitted == true && controller!.text.isEmpty)?  const Icon(Icons.error_outline): null,
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

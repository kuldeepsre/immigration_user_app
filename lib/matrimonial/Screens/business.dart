import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/abroad.dart';
import 'package:immigration/matrimonial/Screens/ilets_tofel_celpip.dart';
import 'package:immigration/matrimonial/Screens/properties_details.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  List <String>? jb =['Job','Business'];
  List <String>? AI =['Below 1 Lakh','1 lakh - 5 lakh','5 lakh - 10 lakh','10 lakh - 20 lakh','20 lakh - 50 lakh', '50 lakh - Above'];
  List<String>? other =['yes','No'];

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  TextEditingController jobOrBusinessController = TextEditingController();
  TextEditingController howLongInProfessionController = TextEditingController();
  TextEditingController nameOfJobOrBusinessController = TextEditingController();
  TextEditingController workPlaceaAddressController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController payIncomeTaxController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController companyDepartmentNameController = TextEditingController();

  String? selectedRIOther;
  String? selectedPayTaxOther;
  String? selectedOtherProperties;
  String? selectedAI;

  uploadData() async {
    _postFunction.postBusinessDetails({
       "mId": '0123',
      "jobBusinessName": nameOfJobOrBusinessController.text,
      "howLongInProfession": howLongInProfessionController.text,
      "jobBusinessAddress": workPlaceaAddressController.text,
      "jobType": selectedJB,
      "payIncomeTax": selectedPayTaxOther,
      "companyDepartmentName": companyDepartmentNameController.text,
      "designation": designationController.text,
      "annualTurnOver":selectedAI,
    });
  }
String? selectedJB='';
  String? selectedOther = '';
  String? selectedValue;
  bool isSubmitted= false;

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
                MaterialPageRoute(builder: (context) => const Properties()),
              );
            },
          ),
          title: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Properties()),
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
                child: Column(
                  children: [
                    const Text(
                      'Source of Income ',
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
                                'Do you work job or business ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: jb!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedJB = e;
                                    });
                                    print(selectedJB);
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
                                          color: (e == selectedJB)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedJB)
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
                    CustomTextField(isSubmitted: isSubmitted, context: context, controller: howLongInProfessionController, labelText: "How long have you been in profession  "),
                    CustomTextField(isSubmitted: isSubmitted, context: context, controller: nameOfJobOrBusinessController, labelText: "Name of the job or business  "),
                    CustomTextField(isSubmitted: isSubmitted, context: context, controller: workPlaceaAddressController, labelText: "City Name  "),
                    CustomTextField(isSubmitted: isSubmitted, context: context, controller: companyDepartmentNameController, labelText: "Company Department Name  "),
                    CustomTextField(isSubmitted: isSubmitted, context: context, controller: designationController, labelText: "Designation  "),
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
                                'Annual Income',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: AI!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedAI = e;
                                    });
                                    print(selectedAI);
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
                                          color: (e == selectedAI)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedAI)
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
                                'Do you pay Income Tax ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: other!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedPayTaxOther = e;
                                    });
                                    print(selectedPayTaxOther);
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
                                          color: (e == selectedPayTaxOther)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedPayTaxOther)
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
                        if (selectedAI!.isEmpty) {
                          print("Annual Income");
                        } else if (selectedJB!.isEmpty) {
                          print("Job or Business");
                        } else if (howLongInProfessionController.text.isEmpty ||
                            howLongInProfessionController.text.length < 1) {
                          print("How long in Profession");
                        } else if (nameOfJobOrBusinessController.text.isEmpty ||
                            nameOfJobOrBusinessController.text.length < 2) {
                          print("Name of Job or Business");
                        } else if (workPlaceaAddressController.text.isEmpty ||
                            workPlaceaAddressController.text.length < 2) {
                          print("Workplace Address");
                        } else if (designationController.text.isEmpty ||
                            designationController.text.length < 2) {
                          print("Designation");
                        } else if (selectedPayTaxOther!.isEmpty) {
                          print("Pay income tax");
                        } else if (companyDepartmentNameController.text.isEmpty ||
                            companyDepartmentNameController.text.length < 2) {
                          print("Designation");


                        }  else {
                          print("start -----------------------");
                          uploadData();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IletsTofelCelpip()),
                          );
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )),
                ),
              ),
            ],
          ),
        ));
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
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        style: const TextStyle(
          color: Color(0xff00225a),
        ),
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
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

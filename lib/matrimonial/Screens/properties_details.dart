import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/abroad.dart';
import 'package:immigration/matrimonial/Screens/business.dart';
import 'package:immigration/matrimonial/Screens/qualification.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';

class Properties extends StatefulWidget {
  const Properties({Key? key}) : super(key: key);

  @override
  _PropertiesState createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  List <String>? property =['House','Apartments and Flats','Village house','Villas','Kothi','None'];
  List<String>? house =['Owner','Rental','Lease','None'];
  List<String>? other =['yes','No'];
  List<String>? wheeler =['2 Wheeler','4 Wheeler','None'];

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();
  List<String> selectedWheelerList=[];
  List<String> selectedPropertyList=[];



  String? selectedRIOther;
  String? selectedHouse = '';
  String? selectedWheeler = '';
  String?  selectedProperty = '';
  String? selectedOtherProperties;
  String?  selectedAgricultre;
  String?  selectedCommercial;

  uploadData() async {
    _postFunction.postPropertyDetails({
      "mId": '0123',
      "house": selectedHouse,
      "commercialProperties": selectedCommercial,
      "agicutureLand": selectedAgricultre,
      "otherProperties": selectedOtherProperties,
      "rentalIncome": selectedRIOther,
      "wheelerType": selectedWheelerList  ,
      "whichTypeOfPropertiesDoYouHave": selectedPropertyList,
    });
  }

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
                MaterialPageRoute(builder: (context) => const Qualification()),
              );
            },
          ),
          title: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Qualification()),
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
                padding: const EdgeInsets.    all(2.0),
                child: Column(
                  children: [
                    const Text(
                      'Properties Information ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),

                    // CustomTextField(isSubmitted: isSubmitted, context: context, controller: houseController, labelText: "House :-"),

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
                                'Which type of properties do you have ? ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: property!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";
                                    if(selectedPropertyList.contains(e)){

                                      setState(() {
                                        selectedPropertyList.removeWhere((element) => element ==e);
                                      });
                                      print(selectedPropertyList);

                                    }else{
                                      setState(() {
                                        selectedPropertyList.add(e);
                                        //   selectedWheeler = e! as List<String>;
                                      });
                                      print(selectedPropertyList);
                                    }},
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (selectedPropertyList.contains(e)==true)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: ( selectedPropertyList.contains(e)==true)
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
                                'House ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: house!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";

                                    setState(() {
                                      selectedHouse = e;
                                    });
                                    print(selectedHouse);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedHouse)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedHouse)
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
                                'Commercial Properties ',
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
                                      selectedCommercial = e;
                                    });
                                    print(selectedCommercial);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedCommercial)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedCommercial)
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
                                'Agriculture Land ',
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
                                      selectedAgricultre = e;
                                    });
                                    print(selectedAgricultre);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedAgricultre)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedAgricultre)
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

                   // CustomTextField(isSubmitted: isSubmitted, context: context, controller: companyDepartmentNameController, labelText: "Company Department Name :-"),
                    //  CustomTextField(isSubmitted: isSubmitted, context: context, controller: otherPropertiesController, labelText: "Other Properties :-"),
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
                                'Other Properties ',
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
                                      selectedOtherProperties = e;
                                    });
                                    print(selectedOtherProperties);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedOtherProperties)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedOtherProperties)
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
                                'Rental Income ',
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
                                      selectedRIOther = e;
                                    });
                                    print(selectedRIOther);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (e == selectedRIOther)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: (e == selectedRIOther)
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
                    //CustomTextField(isSubmitted: isSubmitted, context: context, controller: wheelerTypeController, labelText: "Wheeler type :-"),
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
                                'Wheeler type ',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: wheeler!
                                  .map((e) => InkWell(
                                  onTap: () {
                                    var object = "I LIKE JAVA";
                                    if(selectedWheelerList.contains(e)){

                                      setState(() {
                                        selectedWheelerList.removeWhere((element) => element ==e);
                                      });
                                      print(selectedWheelerList);

                                    }else{
                                     setState(() {
                                       selectedWheelerList.add(e);
                                    //   selectedWheeler = e! as List<String>;
                                     });
                                    print(selectedWheelerList);
                                  }},
                                  child: Padding(
                                    padding: const EdgeInsets.    all(8.0),
                                    child: Container(
                                        width: 90.0,
                                        padding: const EdgeInsets.  all(4.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          border: Border.all(
                                              width: 0.7, color: Colors.grey),
                                          color: (selectedWheelerList.contains(e)==true)
                                              ? kRedColor
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.  all(4.0),
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: ( selectedWheelerList.contains(e)==true)
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
                        if (selectedProperty == null) {
                          print("Property");
                        } else if (selectedCommercial == null) {
                          print("Commercial land");
                        } else if (selectedAgricultre == null) {
                          print("Agriculture land");
                        } else if (selectedRIOther== null) {
                          print("Rental Income");
                        } else if (selectedOtherProperties == null) {
                          print("Other properties");
                        } else if (selectedHouse == null ) {
                          print("House");
                        } else if (selectedWheeler == null) {
                          print("Wheeler type");
                        }   else {
                          print("start -----------------------");
                          uploadData();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Business()),
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
          color: Color(0xff00225a),
        ),
        controller: controller,
        textCapitalization: TextCapitalization.words,
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


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Forms/travell_insurance.dart';
import 'package:immigration/api_config.dart';
import 'package:immigration/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:immigration/screens/MainScreen.dart';

class EducationLoan extends StatefulWidget {
  const EducationLoan({Key? key}) : super(key: key);

  @override
  _EducationLoanState createState() => _EducationLoanState();
}

class _EducationLoanState extends State<EducationLoan> {
  TextEditingController? nameController = new TextEditingController();
  TextEditingController? companyNameController = new TextEditingController();
  TextEditingController? companyAddressController = new TextEditingController();
  TextEditingController? gstController = new TextEditingController();
  TextEditingController? licenseController = new TextEditingController();
  TextEditingController? stablizeController = new TextEditingController();
  TextEditingController? employeeController = new TextEditingController();
  TextEditingController fathernameController = new TextEditingController();
  late TextEditingController? addressController = new TextEditingController();
  late TextEditingController? mobileController = new TextEditingController();
  late TextEditingController? alternateMobileController =
  new TextEditingController();
  late TextEditingController? passportController = new TextEditingController();
  late TextEditingController? aadhaarController = new TextEditingController();
  late TextEditingController? noEmployeeController =
  new TextEditingController();
  late TextEditingController? annualTurnOverController =
  new TextEditingController();
  late TextEditingController? investmentRatioController =
  new TextEditingController();
  late TextEditingController? returnInvestmentController =
  new TextEditingController();
  late TextEditingController? totalAreaController = new TextEditingController();
  late TextEditingController? alterMobileController =
  new TextEditingController();
  late TextEditingController? contactPersonController =
  new TextEditingController();

  var yearSelected;
  var floorSelected;

  //File? _image;
  Dio dio = Dio();
//  PostMethods _postMethods = PostMethods();
  List <String>? property =['House','Apartments and Flats','Village house','Villas','Kothi','None'];
  List<String>? house =['Owner','Rental','Lease','None'];
  List areaType = [
    "Commercial",
    "Residential",
    "SCO",
    "Booth",
  ];


  String? selectedHouse;
  String? selectedproperty;
  var selectedAreaType;
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
          //submit(value.data);
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

  int statuscode = 0;
  String imgUrl = '';
  final picker = ImagePicker();

  late TextEditingController? franchiseOfferCityController =
  new TextEditingController();

  var newConteoller;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff0D47A1)),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  MainScreen(0)),
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Educational Loan",
          style: TextStyle(color: kBlueColor),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Personal Information',
                      style: TextStyle(
                          fontSize: 18,
                          color: kBlueColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CustomTextFormField(
                          readOnly: false,
                          controller: companyNameController,
                          hintText: "Enter Name here",
                          labelText: "Name"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: companyAddressController,
                          hintText: "Enter Father/Husband Name here",
                          labelText: "Father / Husband Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: contactPersonController,
                          hintText: "Enter Date of Birth here",
                          labelText: "Date of Birth"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: mobileController,
                          hintText: "Enter City Name here",
                          labelText: "City Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: alterMobileController,
                          hintText: "Enter  Mobile here",
                          labelText: " Mobile No"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Email Id here",
                          labelText: "Email Id"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Loan Information',
                            style: TextStyle(
                                fontSize: 18,
                                color: kBlueColor,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    
                      CustomTextFormField(
                          readOnly: false,
                          controller: noEmployeeController,
                          hintText: "Purpose of going Abroad",
                          labelText: "Purpose of going Abroad"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: annualTurnOverController,
                          hintText: "Which country do you want to go to?",
                          labelText: "Which country do you want to go to?"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: franchiseOfferCityController,
                          hintText: "Date of Travel ",
                          labelText: "Date of Travel "),

                      CustomTextFormField(
                          readOnly: false,
                          controller: investmentRatioController,
                          hintText: "Type of Trip",
                          labelText: "Type of Trip"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "When you take Loan",
                          labelText: "When you take Loan"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "Which Bank you prefered to take loan ?",
                          labelText: "Which Bank you prefered to take loan ?"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "How much Amount do you take Loan",
                          labelText: "How much Amount do you take Loan"),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Financial Information',
                            style: TextStyle(
                                fontSize: 18,
                                color: kBlueColor,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      CustomTextFormField(
                          readOnly: false,
                          controller: returnInvestmentController,
                          hintText: "Your current ITR value",
                          labelText: "Your current ITR value"),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(side: BorderSide(color:kBlueColor, width: 0.3),borderRadius: BorderRadius.circular(3)),
                          //color: Colors.grey.shade200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 8),
                                child: Text(
                                  'House type',
                                  style: TextStyle(
                                    fontSize: 18,
                                     color: kBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: house!
                                    .map((e) => InkWell(
                                    onTap: () {
                                       selectedHouse = "I LIKE JAVA";

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
                                                width: 0.7, color: kBlueColor),
                                            color: (e == selectedHouse)
                                                ? kBlueColor
                                                : Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.  all(4.0),
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: (e == selectedHouse)
                                                        ? Colors.white
                                                        : kBlueColor)),
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
                          shape: RoundedRectangleBorder(side: BorderSide(color:kBlueColor, width: 0.3),borderRadius: BorderRadius.circular(3)),
                          //color: Colors.grey.shade200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 8),
                                child: Text(
                                  'Any other Property',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: property!
                                    .map((e) => InkWell(
                                    onTap: () {
                                      var object = "I LIKE JAVA";

                                      setState(() {
                                        selectedproperty = e;
                                      });
                                      print(selectedproperty);
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
                                                width: 0.7, color: kBlueColor),
                                            color: (e == selectedproperty)
                                                ? kBlueColor
                                                : Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.  all(4.0),
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: (e == selectedproperty)
                                                        ? Colors.white
                                                        : kBlueColor)),
                                          )),
                                    )))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),

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
                      GestureDetector(
                        onTap: (){
                          getLostData();
                        },
                        child: Card(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              child: statuscode == 100
                  ? AlertDialog(
                insetPadding:
                EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                content: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: SpinKitCubeGrid(
                    color: kBlueColor,
                  ),
                ),
              )
                  : Container())
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String titleName;
  final String hint;

  //final bool? submit;
  final String Function(String?)? validator;
  const NameTextField({
    Key? key,
    required this.titleName,
    // this.submit,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            titleName,
            style: TextStyle(
              color: kBlueColor,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please fill field";
              }
            },
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kBlueColor,
            decoration: InputDecoration(
              // errorText: (submit == true && controller!.text.isEmpty)
              //     ? "Please fill"
              //     : null,
              hintText: hint,
              // suffixIcon: (submit == true && controller!.text.isEmpty)
              //     ? Icon(
              //         Icons.error,
              //         color: Colors.red,
              //       )
              //     : null
            ),
          ),
        ),
      ],
    );
  }
}

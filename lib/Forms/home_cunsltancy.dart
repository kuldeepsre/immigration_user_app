
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Forms/education_loan.dart';
import 'package:immigration/Forms/travell_insurance.dart';
import 'package:immigration/api_config.dart';
import 'package:immigration/constants.dart';
import 'package:http_parser/http_parser.dart';

class HomeCunsultancy extends StatefulWidget {
  const HomeCunsultancy({Key? key}) : super(key: key);

  @override
  _HomeCunsultancyState createState() => _HomeCunsultancyState();
}

class _HomeCunsultancyState extends State<HomeCunsultancy> {
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
  bool loading=false;
  var _image;

  String? selectedpassportType;

  String? selectedservices;
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

  //File? _image;
  Dio dio = Dio();
//  PostMethods _postMethods = PostMethods();
  List<String>? passportType = ['Ordinary Passport','Official Passport','Diplomatic Passport','Emergency Passport','Family Passport','Collective Passport'];

  List services = [
    "New",
    "Emergency Certificate",
    "Re issue",
    "Lost damage",

  ];
  List areaType = [
    "Commercial",
    "Residential",
    "SCO",
    "Booth",
  ];

  var selectedAreaType;

  int statuscode = 0;
  String imgUrl = '';
  final picker = ImagePicker();

  late TextEditingController? franchiseOfferCityController =
  new TextEditingController();
  // showToast(BuildContext context, String msg) {
  //   Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  // }

  var newConteoller;


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Immigration Adda"),
        ),
        backgroundColor: kBlueColor,
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Home Consultancy ',
                    style: TextStyle(
                        fontSize: 18,
                        color: kBlueColor,
                        fontWeight: FontWeight.bold
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
                          hintText: "Enter Mobile no. here",
                          labelText: "Mobile number"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: mobileController,
                          hintText: "Enter City Name here",
                          labelText: "City Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: alterMobileController,
                          hintText: "Enter  Qualification here",
                          labelText: " Qualification"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Preferred Country here",
                          labelText: "Prefered Country"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Preferred City here",
                          labelText: "Preferred City"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Preferred Course here",
                          labelText: "Preferred Course"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Enter Actual requirement here",
                          labelText: "Actual requirement"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: licenseController,
                          hintText: "Do you want Home Consultancy for your requirement",
                          labelText: "Do you want Home Consultancy for your requirement"),
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

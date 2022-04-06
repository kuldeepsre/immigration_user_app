
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
import 'package:immigration/screens/MainScreen.dart';

class Passport extends StatefulWidget {
  const Passport({Key? key}) : super(key: key);

  @override
  _PassportState createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  TextEditingController? nameController = new TextEditingController();
   TextEditingController fathernameController = new TextEditingController();
  late TextEditingController? addressController = new TextEditingController();
  late TextEditingController? mobileController = new TextEditingController();
  late TextEditingController? emailController =
  new TextEditingController();
  late TextEditingController? passportController = new TextEditingController();
  late TextEditingController? aadhaarController = new TextEditingController();
  late TextEditingController? typeOfPassportController =
  new TextEditingController();
  late TextEditingController? typeOfServicesController =
  new TextEditingController();
  late TextEditingController? dobController =
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
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;
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
          "Passport",
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
                          controller: nameController,
                          hintText: "Enter Name here",
                          labelText: "Name"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: fathernameController,
                          hintText: "Enter Father/Husband Name here",
                          labelText: "Father / Husband Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: dobController,
                          hintText: "Enter Date of Birth here",
                          labelText: "Date of Birth"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: addressController,
                          hintText: "Enter City Name here",
                          labelText: "City Name"),
                      CustomTextFormField(
                          readOnly: false,
                          controller: mobileController,
                          hintText: "Enter  Mobile here",
                          labelText: " Mobile No"),

                      CustomTextFormField(
                          readOnly: false,
                          controller: emailController,
                          hintText: "Enter Email Id here",
                          labelText: "Email Id"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Passport Information',
                            style: TextStyle(
                                fontSize: 18,
                                color: kBlueColor,
                                fontWeight: FontWeight.bold
                            ),
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
                                padding: EdgeInsets.only(top: 4.0, left: 8,bottom: 2),
                                child: Text(
                                  'Type of Passport',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: passportType!
                                    .map((e) => InkWell(
                                    onTap: () {
                                      var object = "I LIKE JAVA";

                                      setState(() {
                                        selectedpassportType = e;
                                      });
                                      print(selectedpassportType);
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
                                            color: (e == selectedpassportType)
                                                ? kBlueColor
                                                : Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.  all(4.0),
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: (e == selectedpassportType)
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
                                  'Type of Service',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: services
                                    .map((e) => InkWell(
                                    onTap: () {
                                      // ignore: unused_local_variable
                                      var object = "I LIKE JAVA";

                                      setState(() {
                                        selectedservices = e;
                                      });
                                      print(selectedservices);
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
                                            color: (e == selectedservices)
                                                ? kBlueColor
                                                : Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.  all(4.0),
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: (e == selectedservices)
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

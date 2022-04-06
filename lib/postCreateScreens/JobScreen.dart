import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/jobPost.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:status_alert/status_alert.dart';

import '../api_config.dart';

class JobScreen extends StatefulWidget {
  JobScreen({Key? key}) : super(key: key);
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  bool loading = false;
  bool submitActive=false;

  var _image;
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController qualificationController = new TextEditingController();
  TextEditingController experienceController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();
  TextEditingController interestedController = new TextEditingController();
  TextEditingController designationController = new TextEditingController();
  TextEditingController fieldController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  submit(String postImage) async {
    final String auth = FirebaseAuth.instance.currentUser!.uid;

    var jobPost = JobPost(
        uId: auth,
        salary: salaryController.text,
        name: nameController.text,
        mobileNo: phoneNoController.text,
        qualification: qualificationController.text,
        exerience: experienceController.text,
        interested: interestedController.text,
        location: locationController.text,
        postImage: postImage,
        designation: designationController.text,
        email: emailController.text);

    var res = await http.post(
        Uri.parse("https://frozen-savannah-16893.herokuapp.com/User/jobPost"),
        body: json.encode(jobPost.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });
    if (res.statusCode == 200) {
      print("Luggage Post Success fully complete");
      setState(() {
        loading = false;
        StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          title: 'Done',
          subtitle: '',
          configuration: IconConfiguration(icon: Icons.done),
        );
        Timer(Duration(seconds: 2), () => {Navigator.pop(context)});
      });
    } else {
      setState(() {
        loading = false;
        StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          title: 'Error',
          subtitle: '',
          configuration: IconConfiguration(icon: Icons.error),
        );
        Timer(Duration(seconds: 2), () => {Navigator.pop(context)});
      }); print("Luggage Post failed fully complete${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {


    uploadImage() async {
      Dio dio = new Dio();
      String fileName = _image!.path.split('.').last;
      print(fileName);
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(_image!.path,
            contentType: MediaType("image", fileName))
      });
      return await dio
          .postUri(Uri.parse(ApiConfig.BASE_URL + "User/upload"),
              data: formData)
          .then((value) {
        // if (response!.statusCode != 200) {

        // }

        if (value.statusCode == 200) {
          print(value.data);
          setState(() {

            submit(value.data);
            // statuscode = value.statusCode!;
            // imgUrl = value.data;
          });
        }
      });
    }

    Future<void> getLostData() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        File file = new File(image!.path);
        _image = file;
        print("select image" + _image.toString());
      });
    }

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text(
          "Immigration Adda",
          style: TextStyle(color: kBlueColor),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Center(
                      child: Text(
                        "JOB REQUIREMENT",
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight! / 30,
                            fontWeight: FontWeight.bold,
                            color: kBlueColor),
                      ),
                    ),
                  ),
                ),
                textfield(context, nameController, "Name"),
                textfield(context, phoneNoController, "Phone No",limit: 10),
                textfield(context, emailController, "Email"),
                textfield(context, qualificationController, "Qualification"),
                textfield(context, experienceController, "Experience"),
                textfield(context, salaryController, " Expected Salary"),
                textfield(
                    context, interestedController, "Preferred Department"),
                textfield(
                    context, designationController, "Preferred Designation"),
                textfield(context, locationController, "Preferred Location"),
                GestureDetector(
                  onTap: () {
                    getLostData();
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(6),
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
                                border: Border.all(
                                    color: Colors.black45, width: 0.8),
                                borderRadius: BorderRadius.circular(3)),
                            width: 100,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: TextButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: kBlueColor),
                      onPressed: ()  {
                      setState(() {
                        if (nameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Name");
                        } else if (phoneNoController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Phone No");
                        } else if (emailController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Email");
                        } else if (qualificationController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Qualification");
                        } else if (experienceController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Experience");
                        } else if (salaryController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Salary");
                        } else if (interestedController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Interest");
                        } else if (designationController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Designation");
                        } else if (locationController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Please Fill Name");
                        } else if(_image==null){
                          Fluttertoast.showToast(msg: "Please Select Image");
                        }else{
                         setState(() {

                         });
                          uploadImage();
                         loading=true;
                        }
                        submitActive=true;
                      });
                        print("gfffffffffffffff---------" +
                            emailController.value.text);
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
            loading?Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    color: Colors.white10,
                    child: SpinKitCircle(
                      color: kBlueColor,
                      size: 50,
                    ),
                  )
                : Container(



            )
          ],
        ),
      ),
    );
  }
  Widget textfield(
      BuildContext context, TextEditingController controller, String hint,{int? limit}) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLength:limit!=null?limit:60,textCapitalization: TextCapitalization.words,
inputFormatters: (hint=="phoneNo")?[FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),]:null,
        decoration: InputDecoration(
counterText: "",
            contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
            border: OutlineInputBorder(),
            errorText:(submitActive==true && controller.text.isEmpty)?"Please Fill":null,
            errorBorder: (submitActive==true)?OutlineInputBorder(borderSide: BorderSide(color: Colors.red)):null,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelText: hint),
      ),
    );
  }}



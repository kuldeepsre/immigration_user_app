import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Post/post_view.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/profile.dart';
import 'package:immigration/matrimonial/bottom_navigator.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class UploadProfilePic extends StatefulWidget {
  UploadProfilePic({Key? key}) : super(key: key);

  @override
  _UploadProfilePicState createState() => _UploadProfilePicState();
}

class _UploadProfilePicState extends State<UploadProfilePic> {
  File? image;
  final picker = ImagePicker();
  List<Asset> images = <Asset>[];
  int? statusCode = 0;
  bool uploading = false;
  double val = 0;
  List<File>? _multipleImageList = [];
  bool isDocExists = false;
  int imageCount = 0;
  String? imgUrl = "";
  int? planId;
  int check = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future<int> userIdCheck() async {
    await db.collection("userPlan").doc("12345").get().then((value) async {
      await db.collection("matrimonial").doc("12345").get().then((v) {
        setState(() {
          planId = v.data()!["planId"];
          log("---------plan----$planId-----");
        });
      });
      setState(() {
        isDocExists = value.exists;
        log("-----existxs--------$isDocExists-----");
        imageCount = value.data()!["imageCount"];
        log("----count---------$imageCount-----");
      });
    });
    if (isDocExists == true && planId == 0) {
      log("-----1st");
      setState(() {
        check = 1;
      });
      Fluttertoast.showToast(msg: "Please update your plan!");
    } else if (isDocExists == true && planId == 1) {
      log("-----2t");
      setState(() {
        check = 1;
      });
      log("-check value-2---$check");
      if (imageCount == 2) {
        Fluttertoast.showToast(msg: "Please update your plan!");
        showAboutDialog(context: context, children: [
          Center(child: Text("Error Happen!")),
          Text("To upload image please upgrade your plan!"),
        ]);
      }
    } else if (isDocExists == true && planId == 2) {
      log("-0-------3");
      setState(() {
        check = 1;
      });
      if (imageCount == 5) {
        showAboutDialog(context: context, children: [
          Center(child: Text("Error Happen!")),
          Text("To upload image please upgrade your plan!"),
        ]);
      }
      getImage().then((value) {
        uploadImage();
      });
    } else if (isDocExists == false) {
      log("----------------4");
      getImage().then((value) {
        uploadImage();
      });
      db
          .collection("userPlan")
          .doc("12345")
          .update({"imageCount": 1, "uid": "12345"}).whenComplete(
              () => log("Added image"));
    }
    return check;
  }

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("Image is not added!");
      }
    });
  }

  Dio dio = Dio();

  uploadImage() async {
    setState(() {
      statusCode = 100;
    });
    String fileName = image!.path.split('.').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image!.path,
          contentType: MediaType("image", fileName))
    });
    return await dio
        .postUri(Uri.parse(ApiConfig.BASE_URL + "User/upload"), data: formData)
        .then((value) {
      // if (response!.statusCode != 200) {
      //
      // }

      if (value.statusCode == 200) {
        print("Image Uploaded");
        print(value.data);
        setState(() {
          statusCode = value.statusCode;
          imgUrl = value.data;
        });

        db
            .collection("userPlan")
            .doc("12345")
            .update({"imageCount": imageCount + 1}).whenComplete(
                () => log("image Count ++ success"));
      }
    });
  }
  String _error = 'No Error Dectected';


  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });

  }

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
              MaterialPageRoute(builder: (context) => const Plans()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Plans()),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'About Yourself',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  maxLines: 7,
                  style: TextStyle(
                    color: Color(0xff00235a),
                  ),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Upload your profile picture",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Pick images"),
                onPressed: loadAssets,
              ),
              Container(
                child: buildGridView(),
              ),

              // Container(
              //   alignment: Alignment.topLeft,
              //   child: const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Center(
              //       child: Text(
              //         "Please upload picture to complete your profile",
              //         style: TextStyle(
              //           color: Colors.redAccent,
              //           fontSize: 18,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 50, width: 200,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Plans()),
                      );
                    },
                    child: const Text(
                      "Upload",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
              child: statusCode == 100
                  ? AlertDialog(
                      insetPadding: const EdgeInsets.symmetric(
                          horizontal: 2.0, vertical: 2.0),
                      content: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: const SpinKitCubeGrid(
                          color: kRedColor,
                        ),
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }
}

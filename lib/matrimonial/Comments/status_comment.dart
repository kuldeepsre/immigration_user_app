import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';

class StatusComments extends StatefulWidget {
  const StatusComments({Key? key}) : super(key: key);

  @override
  _StatusCommentsState createState() => _StatusCommentsState();
}

class _StatusCommentsState extends State<StatusComments> {
  
  var storage = FirebaseStorage.instance;
  TextEditingController captionController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  String imgUrl = '';
  String firstName = '';
  String profilePic = '';

  uploadStatus() async {
    await db.collection('matrimonial').doc("0123").get().then((value) {
      setState(() {
        firstName = value.data()!["PersonDetails"]["firstName"];
        profilePic = value.data()!["PersonDetails"]["profilePic"];
      });
      log("----name---   $firstName");
    });
    await db.collection("post").doc('matrimonial').collection('status').add({
      "mid": "12345",
      "imgUrl": imgUrl,
      "caption": captionController.text,
      'createdAt': Timestamp.now(),
      'name': firstName,
      'profilePic': profilePic
    }).then((value) {
      final docId = value.id;
      db
          .collection("post")
          .doc('matrimonial')
          .collection('status')
          .doc(docId)
          .update({"statusId": docId});
    }).whenComplete(() {
      Fluttertoast.showToast(msg: "Post Uploaded");
      Navigator.of(context).pop();
    });
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

  uploadImage() async {
    TaskSnapshot ref = await storage
        .ref("matrimonialstatus")
        .child("FirebaseAuth.instance.currentUser!.uid")
        .putFile(image!);

    if (ref.state == TaskState.success) {
      imgUrl = await ref.ref.getDownloadURL();
      print(imgUrl);
    }
  }

  File? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        title: Text(
          'Immigration Adda',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                getImage().then((value) {
                  uploadImage();
                });
              },
              child: Container(
                height: height * 0.6,
                width: width,
                child: Card(
                  elevation: 1,
                  child: image != null
                      ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: FileImage(image!)),
                          ),
                        )
                      : const Icon(
                          Icons.add_a_photo,
                          size: 60,
                          color: Colors.blueGrey,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Add a caption",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: captionController,
                style: TextStyle(
                  color: Color(0xff00235a),
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 50, width: 150,
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
                    uploadStatus();
                  },
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
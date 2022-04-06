import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';


class MultiImage extends StatefulWidget {
  @override
  _MultiImageState createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {

  List<Asset> images = <Asset>[];
  List<File> imagesFile = <File>[];
  List<String> imagesURL = [];
int statusCode=0;
  String _error = 'No Error Detected';
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  uploadImages(){
    images.forEach((imageAsset) async {
      final filePath = await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier.toString());

      File tempFile = File(filePath!);
      if (tempFile.existsSync()) {
        imagesFile.add(tempFile);
        print("------image----------${imagesFile}----");
      }
    });

    imagesFile.forEach((element) async{
      setState(() {
        statusCode=1;
      });


      final ref = await storage.ref().child("MatrimonialPost").putFile(element);
      imagesURL.add(ref.ref.getDownloadURL().toString());


    });
    setState(() {
      statusCode=0;
    });
    db.collection("matrimonial").doc("0123").update({
      "postImages":FieldValue.arrayUnion(imagesURL)
    }).whenComplete(() {
      print("uploaded");
    });
  }



  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        print("-----images------${images[0]}");
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

   loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#ff5275",
          actionBarTitle: "Select Images",
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
    return MaterialApp(
      home: Scaffold(
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
        body: Column(
          children: <Widget>[
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
                maxLines: 3,
                style: TextStyle(
                  color: Color(0xff00235a),
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Upload your Post",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
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
              child: Text("Tap to Pick Images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 50, width: 200,
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
                    uploadImages();
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
            ),
          ],
        ),
      ),
    );
  }
}
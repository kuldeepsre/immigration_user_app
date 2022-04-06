import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:immigration/Models/UserModel.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/provider/auth_provider.dart';
import 'package:immigration/screens/MainScreen.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../api_config.dart';

class UserProfile extends StatefulWidget {
  final String uId;
  final UserModel? userModel;

  UserProfile({Key? key, required this.uId, this.userModel}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static List<CategoriesType> items = [
    CategoriesType(
      id: 0,
      name: "IELTS",
    ),
    CategoriesType(id: 1, name: "Passport"),
    CategoriesType(id: 2, name: "Study Visa"),
    CategoriesType(
      id: 3,
      name: "Education Loan",
    ),
    // CategoriesType(id: 4, name: "Passport"),
    CategoriesType(
      id: 5,
      name: "Air Ticket",
    ),
    CategoriesType(
      id: 6,
      name: "Travel Insurance",
    ),
    CategoriesType(id: 7, name: "Money Exchange"),
    CategoriesType(
      id: 8,
      name: "Transportation",
    ),
    CategoriesType(
      id: 9,
      name: "Luggage Adjustment",
    ),
    CategoriesType(
      id: 10,
      name: "Accommodation at Abraod",
    ),
    CategoriesType(
      id: 11,
      name: "Jobs at Abroad",
    ),
    CategoriesType(
      id: 12,
      name: "Tour Travel",
    ),
    CategoriesType(
      id: 13,
      name: "Work Permit",
    ),
    CategoriesType(
      id: 14,
      name: "Permanent Residence",
    ),
    CategoriesType(
      id: 15,
      name: "Tourist & Business Visa",
    ),
    CategoriesType(
      id: 16,
      name: "Events",
    ),
    CategoriesType(
      id: 17,
      name: "Job requirements",
    ),
    CategoriesType(
      id: 18,
      name: "International Courier",
    ),
    CategoriesType(
      id: 19,
      name: "Legal Advisor",
    ),
    CategoriesType(
      id: 20,
      name: "Online IELTS Classes",
    ),
    CategoriesType(
      id: 21,
      name: "Franchise",
    ),
    CategoriesType(id: 22, name: "Check Your Score"),
  ];
  final _items = items
      .map((type) => MultiSelectItem<CategoriesType>(type, type.name))
      .toList();
  var getaddress;
  var finalAddress;

  TextEditingController cityController = TextEditingController();

  getCurrentLocAndAddress() async {
    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    getaddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      finalAddress = getaddress;
    });
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController dateOfBirthController = new TextEditingController();
  var _image;
   String? profilePicture;
  int statuscode = 0;
  dynamic categoriedSelected;

  getSubmit() async {
    FirebaseChatCore.instance.createUserInFirestore(types.User(
        firstName: nameController.text,
        id: widget.uId,
        role: types.Role.user,
        imageUrl:profilePicture??
        "http://immigrationadda.com/wp-content/uploads/2021/08/cropped-ic_launcher.png"));
    bool check = false;
    UserModel userModel = new UserModel(
      uId: widget.uId,
      name: nameController.text,
      phoneNo: Provider.of<AuthProvider>(context, listen: false)
          .controllerPhone
          .text,
      email: emailIdController.text,
      city: cityController.text,
      dateOfBirth: dateOfBirthController.text,
      profilePicture: profilePicture??"",
    );
    var res = await http.post(
        Uri.parse("https://frozen-savannah-16893.herokuapp.com/User/Signup"),
        body: json.encode(userModel.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    if (res.statusCode == 200) {
      setState(() {
        statuscode = res.statusCode;
      });
      print("fffffffffff" + res.body);
      check = true;
      return Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainScreen(0)));
    }
    return check;
  }

  uploadImage() async {
    Dio dio = new Dio();
    String fileName = _image!.path.split('.').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(_image!.path,
          contentType: MediaType("image", fileName)),
    });
    return await dio
        .postUri(Uri.parse(ApiConfig.BASE_URL + "Seller/upload"),
            data: formData)
        .then((value) {
      // if (response!.statusCode != 200) {

      // }

      if (value.statusCode == 200) {
        setState(() {
          statuscode = value.statusCode!;
          profilePicture = value.toString();
        });

        print(value.statusCode!.toString() + "----------" + value.toString());
      }
    });
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      statuscode = 100;

      File file = new File(image!.path);
      _image = file;
      uploadImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text(
          "Immigration Adda",
          style: TextStyle(color: kBlueColor),
        ),
      ),
      body: Stack(children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          getLostData();
                        },
                        child: Center(
                          child: _image != null
                              ? CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: FileImage(_image))
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/images/person.png")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18, top: 4),
                        child: Center(
                          child: Text(
                            "Photo Optional",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ),
                      ),
                      customTextField(context, nameController, "Name", true,
                          TextInputType.text),
                      customTextField(
                          context,
                          Provider.of<AuthProvider>(context, listen: false)
                              .controllerPhone,
                          "Phone No",
                          false,
                          TextInputType.phone),
                      customTextField(context, cityController, "City", true,
                          TextInputType.text),
                      SizedBox(height: 30),
                      Text("Interested In"),
                      MultiSelectDialogField(
                        title: Text("Interested In"),
                        items: _items,
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          categoriedSelected = values;
                          //categoriedSelected!.add(values);
                          print(categoriedSelected!.length);
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (value) {
                            setState(() {
                              categoriedSelected!.remove(value);
                            });
                            print(categoriedSelected!.length);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 83.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: height * 0.12,
                            maxWidth: width * 0.8,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => kBlueColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                statuscode = 100;
                              });
                              getSubmit();
                            },
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ])),
          ),
        ),
        Container(
            child: statuscode == 80
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
      ]),
    );
  }
}

Widget customTextField(BuildContext context, TextEditingController controller,
    String labelText, bool enable, var type) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: controller,
      keyboardType: type,
      enabled: enable,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
        labelText: labelText,
        labelStyle: TextStyle(
          color: kBlueColor,
        ),
      ),
    ),
  );
}

class CategoriesType {
  final int id;
  final String name;

  const CategoriesType({required this.id, required this.name});
}

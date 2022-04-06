import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/LuggagePost.dart';
import 'package:status_alert/status_alert.dart';
import '../SizeConfig.dart';
import '../api_config.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class LuggageScreen extends StatefulWidget {
  const LuggageScreen({Key? key}) : super(key: key);

  @override
  _LuggageScreenState createState() => _LuggageScreenState();
}

class _LuggageScreenState extends State<LuggageScreen> {
  late LuggagePost luggagePost;
  bool loading = false;
  var _image;
  bool submitActive = false;

  submit(data) async {
    luggagePost = new LuggagePost(
        pId: "jj",
        name: nameController.text,
        fatherName: fatherNameController.text,
        address: addressController.text,
        phoneNo: mobileNoController.text,
        passportNo: passportNoController.text,
        aadharCard: aadharNoController.text,
        city: cityController.text,
        flightTimeing: flightDateTimeNoController.text,
        flightNameAndNo: flightNameANDFlightNoController.text,
        description: descriptionOfLuggageController.text,
        detailsOfLuggage: detailOfLuggageController.text,
        totalWeight: totalWeightController.text,
        amountOffer: amountOfferController.text,
        receiverName: receiverNameController.text,
        receiverFatherName: receiverFatherNameController.text,
        receiverPassportNo: receiverPassportNoController.text,
        receiverAddress: receiverAddressController.text,
        receiverPhoneNo: receiverMobileNoController.text,
        countryName: dropdownValue,
        alternatePhoneNo: alterMobileNoController.text,
        receiverPersonImage: data,
        uId: FirebaseAuth.instance.currentUser!.uid);

    var res = await http.post(
        Uri.parse(
            "https://frozen-savannah-16893.herokuapp.com/User/luggagePost"),
        body: json.encode(luggagePost.toJson()),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
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
      print("Luggage Post failed fully complete${res.body}");
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
      });
    }
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

  uploadImage() async {
    Dio dio = new Dio();
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
          submit(value.data);
          // statuscode = value.statusCode!;
          // imgUrl = value.data;
        });
      }
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alterMobileNoController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController aadharNoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController flightDateTimeNoController = TextEditingController();
  TextEditingController flightNameANDFlightNoController =
      TextEditingController();
  TextEditingController descriptionOfLuggageController =
      TextEditingController();
  TextEditingController detailOfLuggageController = TextEditingController();
  TextEditingController totalWeightController = TextEditingController();
  TextEditingController amountOfferController = TextEditingController();
  TextEditingController receiverNameController = TextEditingController();
  TextEditingController receiverFatherNameController = TextEditingController();
  TextEditingController receiverAddressController = TextEditingController();
  TextEditingController receiverMobileNoController = TextEditingController();
  TextEditingController receiverPassportNoController = TextEditingController();
  var countryNameList = [
    "Andorra",
    "United Arab Emirates",
    "Afghanistan",
    "Antigua and Barbuda",
    "Anguilla",
    "Albania",
    "Armenia",
    "Angola",
    "Antarctica",
    "Argentina",
    "American Samoa",
    "Austria",
    "Australia",
    "Aruba",
    "Åland",
    "Azerbaijan",
    "Bosnia and Herzegovina",
    "Barbados",
    "Bangladesh",
    "Belgium",
    "Burkina Faso",
    "Bulgaria",
    "Bahrain",
    "Burundi",
    "Benin",
    "Saint Barthélemy",
    "Bermuda",
    "Brunei",
    "Bolivia",
    "Bonaire, Sint Eustatius, and Saba",
    "Brazil",
    "Bahamas",
    "Bhutan",
    "Bouvet Island",
    "Botswana",
    "Belarus",
    "Belize",
    "Canada",
    "Cocos (Keeling) Islands",
    "DR Congo",
    "Central African Republic",
    "Congo Republic",
    "Switzerland",
    "Ivory Coast",
    "Cook Islands",
    "Chile",
    "Cameroon",
    "China",
    "Colombia",
    "Costa Rica",
    "Cuba",
    "Cabo Verde",
    "Curaçao",
    "Christmas Island",
    "Cyprus",
    "Czechia",
    "Germany",
    "Djibouti",
    "Denmark",
    "Dominica",
    "Dominican Republic",
    "Algeria",
    "Ecuador",
    "Estonia",
    "Egypt",
    "Western Sahara",
    "Eritrea",
    "Spain",
    "Ethiopia",
    "Finland",
    "Fiji",
    "Falkland Islands",
    "Micronesia",
    "Faroe Islands",
    "France",
    "Gabon",
    "United Kingdom",
    "Grenada",
    "Georgia",
    "French Guiana",
    "Guernsey",
    "Ghana",
    "Gibraltar",
    "Greenland",
    "The Gambia",
    "Guinea",
    "Guadeloupe",
    "Equatorial Guinea",
    "Greece",
    "South Georgia and South Sandwich Islands",
    "Guatemala",
    "Guam",
    "Guinea-Bissau",
    "Guyana",
    "Hong Kong",
    "Heard and McDonald Islands",
    "Honduras",
    "Croatia",
    "Haiti",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "Isle of Man",
    "India",
    "British Indian Ocean Territory",
    "Iraq",
    "Iran",
    "Iceland",
    "Italy",
    "Jersey",
    "Jamaica",
    "Jordan",
    "Japan",
    "Kenya",
    "Kyrgyzstan",
    "Cambodia",
    "Kiribati",
    "Comoros",
    "St Kitts and Nevis",
    "North Korea",
    "South Korea",
    "Kuwait",
    "Cayman Islands",
    "Kazakhstan",
    "Laos",
    "Lebanon",
    "Saint Lucia",
    "Liechtenstein",
    "Sri Lanka",
    "Liberia",
    "Lesotho",
    "Lithuania",
    "Luxembourg",
    "Latvia",
    "Libya",
    "Morocco",
    "Monaco",
    "Moldova",
    "Montenegro",
    "Saint Martin",
    "Madagascar",
    "Marshall Islands",
    "North Macedonia",
    "Mali",
    "Myanmar",
    "Mongolia",
    "Macao",
    "Northern Mariana Islands",
    "Martinique",
    "Mauritania",
    "Montserrat",
    "Malta",
    "Mauritius",
    "Maldives",
    "Malawi",
    "Mexico",
    "Malaysia",
    "Mozambique",
    "Namibia",
    "New Caledonia",
    "Niger",
    "Norfolk Island",
    "Nigeria",
    "Nicaragua",
    "Netherlands",
    "Norway",
    "Nepal",
    "Nauru",
    "Niue",
    "New Zealand",
    "Oman",
    "Panama",
    "Peru",
    "French Polynesia",
    "Papua New Guinea",
    "Philippines",
    "Pakistan",
    "Poland",
    "Saint Pierre and Miquelon",
    "Pitcairn Islands",
    "Puerto Rico",
    "Palestine",
    "Portugal",
    "Palau",
    "Paraguay",
    "Qatar",
    "Réunion",
    "Romania",
    "Serbia",
    "Russia",
    "Rwanda",
    "Saudi Arabia",
    "Solomon Islands",
    "Seychelles",
    "Sudan",
    "Sweden",
    "Singapore",
    "Saint Helena",
    "Slovenia",
    "Svalbard and Jan Mayen",
    "Slovakia",
    "Sierra Leone",
    "San Marino",
    "Senegal",
    "Somalia",
    "Suriname",
    "South Sudan",
    "São Tomé and Príncipe",
    "El Salvador",
    "Sint Maarten",
    "Syria",
    "Eswatini",
    "Turks and Caicos Islands",
    "Chad",
    "French Southern Territories",
    "Togo",
    "Thailand",
    "Tajikistan",
    "Tokelau",
    "Timor-Leste",
    "Turkmenistan",
    "Tunisia",
    "Tonga",
    "Turkey",
    "Trinidad and Tobago",
    "Tuvalu",
    "Taiwan",
    "Tanzania",
    "Ukraine",
    "Uganda",
    "U.S. Outlying Islands",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vatican City",
    "St Vincent and Grenadines",
    "Venezuela",
    "British Virgin Islands",
    "U.S. Virgin Islands",
    "Vietnam",
    "Vanuatu",
    "Wallis and Futuna",
    "Samoa",
    "Kosovo",
    "Yemen",
    "Mayotte",
    "South Africa",
    "Zambia",
    "Zimbabwe"
  ];
  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Immigration Adda',
          style: TextStyle(
            color: kBlueColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              textfield(context, nameController, "Name"),
              textfield(context, fatherNameController, "Father Name"),
              textfield(context, addressController, "Address"),
              textfield(context, mobileNoController, "Mobile No",
                  keyboardType: TextInputType.phone,limit: 10),
              textfield(context, alterMobileNoController, "Alternate Mobile No",
                  keyboardType: TextInputType.phone,limit: 10),
              textfield(context, passportNoController, "Passport Number"),
              textfield(context, aadharNoController, "Aadhaar Number",
                  keyboardType: TextInputType.number,limit: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Select Country"),
                    value: dropdownValue,
                    isExpanded: true,
                    elevation: 16,
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 18,
                    ),
                    underline: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: kBlueColor,
                    ),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value.toString();
                      });
                    },
                    items: countryNameList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              textfield(context, cityController, "City"),
              textfield(
                  context, flightDateTimeNoController, "Flight date and time"),
              textfield(context, flightNameANDFlightNoController,
                  "Flight Name and Number"),
              textfield(context, descriptionOfLuggageController,
                  "Description of Luggage"),
              textfield(
                  context, detailOfLuggageController, "Details of Luggage"),
              textfield(context, totalWeightController, "Total Weight",
                  keyboardType: TextInputType.number),
              textfield(context, amountOfferController, "Amount offer",
                  keyboardType: TextInputType.number),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  color: kBlueColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text("Receiver Details",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              textfield(context, receiverNameController, "Receiver Name"),
              textfield(context, receiverFatherNameController,
                  "Receiver Father Name"),
              textfield(context, receiverAddressController, "Receiver Address"),
              textfield(
                  context, receiverMobileNoController, "Receiver Mobile Number",
                  keyboardType: TextInputType.phone,limit: 10),
              textfield(context, receiverPassportNoController,
                  "Receiver Passport Number"),
              GestureDetector(
                onTap: () {
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
                              border:
                                  Border.all(color: Colors.black45, width: 0.8),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: TextButton(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: kBlueColor),
                    onPressed: () {
                      setState(() {
                        submitActive = true;
                        if (nameController.text.isEmpty) {
                        } else if (fatherNameController.text.isEmpty) {
                        } else if (addressController.text.isEmpty) {
                        } else if (mobileNoController.text.isEmpty) {
                        } else if (alterMobileNoController.text.isEmpty) {
                        } else if (passportNoController.text.isEmpty) {
                        } else if (aadharNoController.text.isEmpty) {
                        } else if (cityController.text.isEmpty) {
                        } else if (flightDateTimeNoController.text.isEmpty) {
                        } else if (flightNameANDFlightNoController
                            .text.isEmpty) {
                        } else if (descriptionOfLuggageController
                            .text.isEmpty) {
                        } else if (detailOfLuggageController.text.isEmpty) {
                        } else if (totalWeightController.text.isEmpty) {
                        } else if (amountOfferController.text.isEmpty) {
                        } else if (receiverNameController.text.isEmpty) {
                        } else if (receiverFatherNameController.text.isEmpty) {
                        } else if (receiverAddressController.text.isEmpty) {
                        } else if (receiverMobileNoController.text.isEmpty) {
                        } else if (receiverPassportNoController.text.isEmpty) {
                        } else if (_image == null) {
                        } else {
                          loading = true;
                          uploadImage();
                        }
                      });
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
          loading == true
              ? Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  color: Colors.white10,
                  child: SpinKitCircle(
                    color: kBlueColor,
                    size: 50,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget textfield(
      BuildContext context, TextEditingController controller, String hint,
      {TextInputType? keyboardType,int? limit}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        maxLength:limit!=null?limit:60,textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          counterText: "",

            contentPadding: EdgeInsets.only(top: 15, bottom: 6, left: 10),
            errorText: (submitActive == true && controller.text.isEmpty)
                ? "Please Fill"
                : null,
            errorBorder: (submitActive == true)
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                : null,
            border: OutlineInputBorder(),
            labelText: hint),
      ),
    );
  }
}

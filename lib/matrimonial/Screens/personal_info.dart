import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Post/post_view.dart';
import 'package:immigration/matrimonial/bottom_navigator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/about_yourself.dart';
import 'package:immigration/matrimonial/Screens/contact_info.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';
import 'package:immigration/matrimonial/model/Post%20Data/personal_info_model.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  List<String>? living = ['India', 'Abroad'];
  List<String> selectedCountries = [];

  List<String>? countries = [
    'Canada',
    'USA',
    'Australia',
    'New Zealand',
    'U.K',
    'Germany',
    'France',
    'Italy',
    'Norway',
    'Russia',
    'Austria',
    'Portugal',
    'China',
    'Japan',
    'Pakistan',
    'Saudi arab',
    'UAE',
    'Singapore',
    'Malaysia',
    'Fizi',
    'Brazil',
    'Argentina',
    'Europe',
    'A Gulf Countries',
    'Asia',
    'Africa',
    'South America',
    'Nepal',
    'Sri Lanka',
    'Other'
  ];
  List<String>? inch = [
    "5'0''",
    "5'1''",
    "5'2''",
    "5'3''",
    "5'4''",
    "5'5''",
    "5'6''",
    "5'7''",
    "5'8''",
    "5'9''",
    "5'10''",
    "5'11''",
    "6'0''",
    "6'1''",
    "6'2''",
    "6'2''",
    "6'3''",
    "6'4''",
    "6'5''",
    "6'6''",
    "Above"
  ];

  List<String>? livingstatus = [
    'Citizenship',
    'Tourist Visa',
    "Work Permit",
    "Permanent Resident",
    "Study Visa",
    "None",
  ];
  List<String>? wherechild = ['Live together', 'Separate', 'None'];
  List<String>? nochild = ['None', '1', '2', '3', '4', 'Or More'];
  List<String>? bodytype = [
    'slim',
    'Tone',
    'Muscular',
    'Stocky',
    'Large',
    'Average'
  ];
  List<String>? complexion = [
    'Fair skin',
    "Medium skin",
    "Olive skin",
    "Brown skin",
    "Black skin",
  ];
  List drinkingList = ["Yes", "No", "Occasionally Drink"];
  List smoking = ["Yes", "No"];
  List ieltsTofelList = ["IELTS", "TOFEL", "No"];
  List<String>? gender = ["Male", "Female", "Other"];
  List<String>? maritalStatus = [
    'Single',
    'Widow / Widower',
    'Divorced',
    'Awaiting Divorced'
  ];
  List<String>? motherTongueList = [
    "Assamese",
    "Bengali",
    "Bodo",
    "Dogri",
    "Gujarati",
    "Hindi",
    "Kannada",
    "Konkani",
    "Malayal",
    "Manipuri",
    "Marathi",
    "Nepali",
    "Odia",
    "Punjabi",
    "Sanskrit",
    "Santali",
    "Sindhi",
    "Tamil",
    "Telugu",
    "Urdu",
  ];

  List<String> dietList = [
    "Veg",
    "Non-Veg",
    "Eggetarian",
    "Jain",
    "Vegan",
    "Occasionally Non-Veg",
  ];
  List<String>? ielts = ['Yes', 'No', 'Perusing'];
  final PersonalInfoModel _personalInfoModel = PersonalInfoModel();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController bodyTypeController = TextEditingController();
  TextEditingController complexionController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController whereAreTheChildrenController = TextEditingController();
  TextEditingController dietController = TextEditingController();
  TextEditingController drinkingController = TextEditingController();
  TextEditingController smokingController = TextEditingController();
  TextEditingController presentLivingInController = TextEditingController();
  TextEditingController livingStatusController = TextEditingController();
  TextEditingController permanentLivingController = TextEditingController();
  TextEditingController motherTongueController = TextEditingController();
  TextEditingController ieltsTofelController = TextEditingController();

  final PostFunction _postFunction = PostFunction();
  Dio dio = Dio();

  String? complexionValue = '';

  String? bodyTypeValue = '';
  String selectedLivingStatusValue = '';
  String? maritalStatusValue;

  String selectedBodyType = '';
  String selectedNoChild = '';

  String selectedComplexionType = '';

  String selectedMaritalStatus = '';

  String selectedDiet = "";

  String selectedDrinking = '';

  String selectedSmoking = '';

  String selectedMotherTongue = '';
  String selectedWherechild = '';

  String selectedFoot = '';

  Object? selectedInch;

  String? selectedCoutries;

  String? selectedPresentLiving;

  String? selectedPermanenttLiving;

  String? selectedIelts;

  String? selectedgender;

  uploadData() async {
    _postFunction.postPersonalInfo({
      "mId": '0123',
      "firstName": firstNameController.text,
      "age": ageController.text,
      "lastName": firstNameController.text,
      "dob": selectedDate.toLocal().toString().split(' ')[0],
      "height": selectedInch.toString(),
      "weight": weightController.text,
      "gender": selectedgender.toString(),
      "bodyType": selectedValue.toString(),
      "complexion": selectedComplexionType,
      "maritalStatus": selectedMaritalStatus,
      "noOfChildren": selectedNoChild.toString(),
      "whereAreTheChildren": selectedWherechild.toString(),
      "diet": selectedDiet,
      "drinking": selectedDrinking,
      "smoking": selectedSmoking,
      "presentLivingIn": presentLivingInController.text,
      "permanentLivingIn": permanentLivingController.text,
      "motherTongue": selectedMotherTongue.toString(),
      "ieltsTofel": ieltsTofelController.text,
      "livingStatus": selectedLivingStatusValue.toString(),
    });
  }

  String? selectedValue;
  bool isSubmitted = false;
  DateTime selectedDate = DateTime.now();
  pickDate() {
    DatePickerDialog(
        // currentDate: DateTime.now(),
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 70000)),
        lastDate: DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1949),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      print(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final select = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
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
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomNav()),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Personal Information ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              CustomeTextField(
                controller: firstNameController,
                labelText: 'First Name',
                isSubmitted: isSubmitted,
                onChanged: (val) {
                  setState(() {
                    _personalInfoModel.firstName = val;
                  });
                  print(_personalInfoModel.firstName);
                },
              ),
              CustomeTextField(
                  isSubmitted: isSubmitted,
                  labelText: "Last Name",
                  controller: lastNameController),
              CustomeTextField(
                  isSubmitted: isSubmitted,
                  labelText: "Age",
                  controller: ageController),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                child: TextField(
                  readOnly: true,
                  // enabled: false,
                  onTap: () {
                    print("Tappd1");
                    _selectDate(context);
                  },
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: TextEditingController(
                      text: selectedDate.toLocal().toString().split(' ')[0]),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 15, bottom: 6, left: 10),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Date of Birth',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff5275),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Gender',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: gender!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedgender = e;
                                  });
                                  print(selectedgender);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedgender)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedgender)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Living Status',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: livingstatus!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedLivingStatusValue = e;
                                  });
                                  print(selectedLivingStatusValue);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedLivingStatusValue)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedLivingStatusValue)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Height',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: inch!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedInch = e;
                                  });
                                  print(selectedInch);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 70.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedInch)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedInch)
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

              // CustomeTextField( isSubmitted: isSubmitted,
              //     labelText: "Weight", controller: weightController),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Body Type',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: bodytype!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedBodyType = e;
                                  });
                                  print(selectedBodyType);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedBodyType)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedBodyType)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Complexion',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: complexion!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedComplexionType = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 80.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedComplexionType)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedComplexionType)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Marital Status',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: maritalStatus!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMaritalStatus = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 80.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedMaritalStatus)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    (e == selectedMaritalStatus)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Diet',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: dietList
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedDiet = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 80.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedDiet)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedDiet)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Number of Children',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: nochild!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedNoChild = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedNoChild)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedNoChild)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Where are the Children',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: wherechild!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedWherechild = e;
                                  });
                                  print(selectedWherechild);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedWherechild)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedWherechild)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Drinking',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: drinkingList
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedDrinking = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 100.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedDrinking)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedDrinking)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Smoking',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: smoking
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedSmoking = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 100.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedSmoking)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: (e == selectedSmoking)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'present Living in',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: living!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedPresentLiving = e;
                                  });
                                  print(selectedPresentLiving);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedPresentLiving)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color:
                                                    (e == selectedPresentLiving)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Permanent Living in',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: living!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedPermanenttLiving = e;
                                  });
                                  print(selectedPermanenttLiving);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedPermanenttLiving)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e ==
                                                        selectedPermanenttLiving)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Ielts / Tofel',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: ielts!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";

                                  setState(() {
                                    selectedIelts = e;
                                  });
                                  print(selectedIelts);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedIelts)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (e == selectedIelts)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Interested Countries',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: countries!
                            .map((e) => InkWell(
                                onTap: () {
                                  var object = "I LIKE JAVA";
                                  if (selectedCountries.contains(e)) {
                                    setState(() {
                                      selectedCountries.removeWhere(
                                          (element) => element == e);
                                    });
                                    print(selectedCountries);
                                  } else {
                                    setState(() {
                                      selectedCountries.add(e);
                                      //   selectedWheeler = e! as List<String>;
                                    });
                                    print(selectedCountries);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (selectedCountries.contains(e) ==
                                                true)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            style: TextStyle(
                                                color: (selectedCountries
                                                            .contains(e) ==
                                                        true)
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.3),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8),
                        child: Text(
                          'Mother Tongue',
                          style: TextStyle(
                            color: kRedColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: motherTongueList!
                            .map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMotherTongue = e;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      width: 90.0,
                                      padding: const EdgeInsets.all(4.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            width: 0.7, color: Colors.grey),
                                        color: (e == selectedMotherTongue)
                                            ? kRedColor
                                            : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    (e == selectedMotherTongue)
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isSubmitted = true;
                      });
                      if (firstNameController.text.isEmpty ||
                          firstNameController.text.length < 3) {
                        print('First Name');
                      } else if (lastNameController.text.isEmpty ||
                          lastNameController.text.length < 3) {
                        print('Last Name');
                      } else if (ageController.text.isEmpty ||
                          ageController.text.length < 1) {
                        print('Age');
                      } else if (selectedDate
                          .toLocal()
                          .toString()
                          .split(' ')[0]
                          .isEmpty) {
                        print('DOB');
                      } else if (selectedgender!.isEmpty) {
                        print('Gender');
                      } else if (selectedInch == null) {
                        print('Height');
                      } else if (selectedBodyType==null) {
                        print('BodyType');
                      } else if (selectedMaritalStatus.isEmpty) {
                        print('Marital Status');
                      } else if (selectedNoChild.isEmpty) {
                        print('Number of children');
                      } else if (selectedWherechild.isEmpty) {
                        print('Where are the Children');
                      } else if (selectedDiet.isEmpty) {
                        print('Diet');
                      } else if (selectedSmoking.isEmpty) {
                        print('Smoking');
                      } else if (selectedDrinking.isEmpty) {
                        print('Drinking');
                      } else if (selectedCountries.isEmpty) {
                        print('Countries');
                      } else {
                        if (selectedPresentLiving!.isEmpty) {
                          print('Present Living');
                        } else if (selectedPermanenttLiving!.isEmpty) {
                          print('Permanent Living');
                        } else if (selectedMotherTongue.isEmpty) {
                          print('Mother Tongue');
                        } else if (selectedIelts!.isEmpty) {
                          print('Ielts / Tofel');
                        } else if (selectedLivingStatusValue.isEmpty) {
                          print('Living status');
                        } else {
                          uploadData();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactInfo(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      age: ageController.text,
                                      dob: selectedDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0]
                                          .toString(),
                                      height: selectedInch.toString(),
                                      livingStatus: selectedLivingStatusValue,
                                      weight: weightController.text,
                                      bodyType: selectedBodyType,
                                      complexion: selectedComplexionType,
                                      maritalStatus: selectedMaritalStatus,
                                      noOfChildrens: selectedNoChild,
                                      whereAreChildren: selectedWherechild,
                                      diet: selectedDiet,
                                      drinking: selectedDrinking,
                                      smoking: selectedSmoking,
                                      gender: selectedgender,
                                      presentLiving: selectedPresentLiving,
                                      permanentLivingIn:
                                          selectedPermanenttLiving,
                                      motherTongue: selectedMotherTongue,
                                      ieltsTofel: selectedIelts,
                                      interestedCounty: selectedCountries,
                                    )),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
              // TextButton(onPressed: (){uploadData();}, child: const Text('Continue',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold
              //   ),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap ChipCard(List? list, Function()? onTap, String selected) {
    return Wrap(
      children: list!
          .map((e) => InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 90.0,
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 0.7, color: Colors.grey),
                      color: (e == selectedBodyType) ? kRedColor : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(e,
                          style: TextStyle(
                              color: (e == selectedBodyType)
                                  ? Colors.white
                                  : kRedColor)),
                    )),
              )))
          .toList(),
    );
  }
}

class CustomeTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextCapitalization? words;
  final String? labelText;
  bool? isSubmitted;

  CustomeTextField(
      {Key? key,
      this.onChanged,
      required this.labelText,
      required this.controller,
      this.isSubmitted,
      this.words})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          errorText: (isSubmitted == true && controller!.text.isEmpty)
              ? "Please fill field"
              : null,
          suffixIcon: (isSubmitted == true && controller!.text.isEmpty)
              ? const Icon(Icons.error_outline)
              : null,
          contentPadding: const EdgeInsets.only(top: 15, bottom: 6, left: 10),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: const OutlineInputBorder(
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

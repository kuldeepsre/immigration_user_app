import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Data/get_functions.dart';
import 'package:immigration/matrimonial/Data/post_function.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/model/Get%20Data/get_profile.dart';
import 'package:immigration/matrimonial/model/Post%20Data/abroad_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/business_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/family_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/ilets_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/marriage_interested_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/partner_prefference_details.dart';
import 'package:immigration/matrimonial/model/Post%20Data/property_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/qualification_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  Dio dio = Dio();
  final PostFunction _postFunction = PostFunction();

  uploadData() async {}

  String? selectedValue;

  pickDate() {
    DatePickerDialog(
        // currentDate: ,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 70000)),
        lastDate: DateTime.now());
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 8),
        lastDate: DateTime(1960));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      print(selectedDate);
    }
  }

  DateTime selectedDate = DateTime.now();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController smokingController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bodyTypeController = TextEditingController();
  TextEditingController complexionController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController whereAreChildrenController = TextEditingController();
  TextEditingController dietController = TextEditingController();
  TextEditingController drinkingController = TextEditingController();
  TextEditingController presentLivingInController = TextEditingController();
  TextEditingController permanentLivingInController = TextEditingController();
  TextEditingController motherTongueController = TextEditingController();
  TextEditingController iletsTofelController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController alternativePhoneNoController = TextEditingController();
  TextEditingController whatsappNoController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController castController = TextEditingController();
  TextEditingController subcastController = TextEditingController();
  TextEditingController affulenceController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherStatusController = TextEditingController();
  TextEditingController fatherLivingInIndiaAbroadController =
      TextEditingController();
  TextEditingController ifFatherAbroadLivingStatusController =
      TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController motherStatusController = TextEditingController();
  TextEditingController motherLivingInIndiaAbroadController =
      TextEditingController();
  TextEditingController ifMotherAbroadLivingStatusController =
      TextEditingController();
  TextEditingController noOfBrotherController = TextEditingController();
  TextEditingController ifBrotherLivingInAbroadStatusController =
      TextEditingController();
  TextEditingController brotherLivingInIndiaAbroadController =
      TextEditingController();
  TextEditingController noOfSisterController = TextEditingController();
  TextEditingController sisterLivingInIndiaAbroadController =
      TextEditingController();
  TextEditingController ifSisterLivingAbroadStatusController =
      TextEditingController();
  TextEditingController highestQualificationController =
      TextEditingController();
  TextEditingController nameOfUniversityController = TextEditingController();
  TextEditingController percentageGradeController = TextEditingController();
  TextEditingController passingYearController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController otherPropertiesController = TextEditingController();
  TextEditingController twoWheelerController = TextEditingController();
  TextEditingController fourWheelerController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController annualTurnoverController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController companyDepartmentNameController =
      TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController rentalIncomeController = TextEditingController();
  TextEditingController whatHaveYouClearedFromTheController =
      TextEditingController();
  TextEditingController howManyScoredOrBandsYouGetController =
      TextEditingController();
  TextEditingController passingDateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController howManyTimeYouGoToAbroadController =
      TextEditingController();
  TextEditingController whereAreYouLivingController = TextEditingController();
  TextEditingController typeOfVisaController = TextEditingController();
  TextEditingController takeSponsorshipFromAbroadController =
      TextEditingController();
  TextEditingController howLongLivingInAbroadController =
      TextEditingController();
  TextEditingController makingMoneyInAbroadController = TextEditingController();
  TextEditingController whenYouCameFromAbroadController =
      TextEditingController();
  TextEditingController whereLivingInAbroadController = TextEditingController();
  TextEditingController workJobOrBusinessController = TextEditingController();
  TextEditingController howLongInProfessionController = TextEditingController();
  TextEditingController nameOfJobORBusinessController = TextEditingController();
  TextEditingController addressOfWorkPlaceController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController doYouPayIncomeTaxController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController whereAreTheChildrenController = TextEditingController();
  TextEditingController subCastController = TextEditingController();
  TextEditingController iletsPteTofelController = TextEditingController();
  TextEditingController workingController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController interestedToMarriageController =
      TextEditingController();
  TextEditingController livingStatusController = TextEditingController();

  List<String> selectedCountries = [];
  List<String>? livingstatus = [
    'Citizenship',
    'Tourist Visa',
    "Work Permit",
    "Permanent Resident",
    "Study Visa",
    'Dose not matter',
  ];
  List<String>? highQualification = [
    'Matric',
    '+2',
    'Bachelors',
    'Postgraduate',
    'Certificate',
    'Diploma',
    'Doesnot matter'
  ];
  List<String>? ielts = [
    'IELTS',
    'TOFEL',
    'CELPIP',
    'PTE',
    'CD-IELTS',
    'NAATI',
    'CAEL',
    'Does not matter '
  ];
  List<String>? wherechild = ['Live together', 'Separate', 'None'];
  List<String>? nochild = ['Yes', 'No', 'Dose not matter'];
  List<String>? bodytype = [
    'slim',
    'Tone',
    'Muscular',
    'Stocky',
    'Large',
    'Average',
    'Dose not matter'
  ];
  List<String>? complexion = [
    'Fair skin',
    "Medium skin",
    "Olive skin",
    "Brown skin",
    "Black skin",
    'Dose not matter'
  ];
  List drinkingList = ["Yes", "No", "Occasionally Drink", 'Dose not matter'];
  List smoking = ["Yes", "No", "Occasionally Smoking", 'Dose not matter'];
  List ieltsTofelList = ["IELTS", "TOFEL", "No"];
  List work = ['Working', 'Non Working', 'Does not matter'];

  List<String>? maritalStatus = [
    'Single',
    'Widow / Widower',
    'Divorced',
    'Dose not matter'
  ];
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
    'Does not matter'
  ];
  List<String> selectedMotherTongue = [''];
  List<String>? marriagewith = ['Indian', 'Foreigner', 'Does not matter'];

  List<String> dietList = [
    "Veg",
    "Non-Veg",
    "Occasionally Non-Veg",
    "Eggetarian",
    "Jain",
    "Vegan",
    'Dose not matter'
  ];

  String selectedLivingStatusValue = '';
  String selectedBodyType = '';
  String selectedNoChild = '';
  String selectedComplexionType = '';
  String selectedMaritalStatus = '';
  String selectedDiet = "";
  String selectedDrinking = '';
  String selectedSmoking = '';
  String selectedWherechild = '';
  String? selectedMarriageWith;
  String? selectedWork;
  String? selectedHighQualification;
  String? selectedCountry;
  String? selectedIelts;

  showCustomDialog() {
    return showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Something Went Wrong!"),
            ));
  }

  final _formKey = GlobalKey<FormState>();

  void getProfile() async {
    var response =
        await Dio().get('https://frozen-savannah-16893.herokuapp.com/');
    print(response.data);
  }

  GetFunction getFunction = GetFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeae9e9),
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ImageUpload()),
            // );
          },
        ),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Upload your Status',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          FutureBuilder<ProfileModel>(
              future: getFunction.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UploadProfilePic()),
                                  );
                                },
                                child: const Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    backgroundImage:
                                        AssetImage('Images/welcome.png'),
                                    radius: 70,
                                    //Text
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.firstName.toString(),
                                    labelText: "First name"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.lastName.toString(),
                                    labelText: "Last name"),

                                CustomTextFieldtoShowData(

                                    data: snapshot.data!.dob.toString(),
                                    labelText: "DOB"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.height.toString(),
                                    labelText: "Height"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.gender.toString(),
                                    labelText: "Gender"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.bodyType.toString(),
                                    labelText: "Body Type"),
                                CustomTextFieldtoShowData(
                                    data:
                                        snapshot.data!.complexion.toString(),
                                    labelText: "Complexion"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.maritalStatus
                                        .toString(),
                                    labelText: "Marital Status"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.noOfChildren
                                        .toString(),
                                    labelText: "No. of Children"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.whereAreTheChildren
                                        .toString(),
                                    labelText: "Where are the Children"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.diet.toString(),
                                    labelText: "Diet"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.drinking.toString(),
                                    labelText: "Drinking"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.smoking.toString(),
                                    labelText: "Smoking"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.presentLivingIn
                                        .toString(),
                                    labelText: "Present Living"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.permanentLivingIn
                                        .toString(),
                                    labelText: "Permanent Living"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.motherTongue
                                        .toString(),
                                    labelText: "Mother Tongue"),
                                CustomTextFieldtoShowData(
                                    data:
                                        snapshot.data!.ieltsTofel.toString(),
                                    labelText: "IELTS / TOFEL"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Contact Information',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.phoneNo.toString(),
                                  labelText: "Phone Number"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.alternativePhoneNo
                                      .toString(),
                                  labelText: "Alternative Phone Number"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.whatsAppNo.toString(),
                                  labelText: "Whatsapp Number"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.emailId.toString(),
                                  labelText: "Email Id"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.address.toString(),
                                  labelText: "City"),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ]);
                }

                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<FamilyModel>(
              future: getFunction.getFamilyDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Family & Cast information',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.religiion.toString(),
                                  labelText: "Religion"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.cast.toString(),
                                  labelText: "Cast"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.subCast.toString(),
                                  labelText: "SubCast"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.fatherName.toString(),
                                  labelText: "Father Name"),
                              CustomTextFieldtoShowData(
                                  data:
                                      snapshot.data!.fatherStatus.toString(),
                                  labelText: "Father Status"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.fatherCountryStatus
                                      .toString(),
                                  labelText:
                                      "They are living in India / Abroad"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.fatherLivingStatus
                                      .toString(),
                                  labelText:
                                      "If Abroad, Then there living status"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.motherName.toString(),
                                  labelText: "Mother Name"),
                              CustomTextFieldtoShowData(
                                  data:
                                      snapshot.data!.motherStatus.toString(),
                                  labelText: "Mother Status"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.motherCountryStatus
                                      .toString(),
                                  labelText:
                                      "They are living in india/ Abroad"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.motherLivingStatus
                                      .toString(),
                                  labelText:
                                      "If Abroad, Then there living status"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.noOfBrother.toString(),
                                  labelText: "Number of Brother"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.brotherCountryStatus
                                      .toString(),
                                  labelText:
                                      "They are living in india/ abroad"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.brotherLivingStatus
                                      .toString(),
                                  labelText:
                                      "If Abroad, Then there living status"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.noOfSister.toString(),
                                  labelText: "Number of Sister"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.sisterCountryStatus
                                      .toString(),
                                  labelText:
                                      "They are living in india/ abroad"),
                              CustomTextFieldtoShowData(
                                  data: snapshot.data!.sisterLivingStatus
                                      .toString(),
                                  labelText:
                                      "If Abroad, Then there living status"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<QualificationModel>(
              future: getFunction.getQualifictionDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Qualification',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.highestQualifiction
                                        .toString(),
                                    labelText: "Highest Qualification"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.universityName
                                        .toString(),
                                    labelText: "Name of the University"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.percentageGrade
                                        .toString(),
                                    labelText: "Percentage / Grade"),
                                CustomTextFieldtoShowData(
                                    data:
                                        snapshot.data!.passingYear.toString(),
                                    labelText: "Passing Year"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<PropertyModel>(
              future: getFunction.getPropertyModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Financial Position',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.house.toString(),
                                    labelText: "House"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.otherProperties
                                        .toString(),
                                    labelText: "Other Properties"),
                                CustomTextFieldtoShowData(
                                    data:
                                        snapshot.data!.wheelerType.toString(),
                                    labelText: " Wheeler Type"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<BusinessModel>(
              future: getFunction.getBusinessModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Income Source',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.jobBusinessName
                                        .toString(),
                                    labelText: "Business Name"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.jobBusinessAddress
                                        .toString(),
                                    labelText: "Business Address"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.annualTurnOver
                                        .toString(),
                                    labelText: "Annual turnover"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.jobType.toString(),
                                    labelText: "Job Type"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.companyDepartmentName
                                        .toString(),
                                    labelText: "Company Department name"),
                                CustomTextFieldtoShowData(
                                    data:
                                        snapshot.data!.designation.toString(),
                                    labelText: "Designation"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.salary.toString(),
                                    labelText: "Salary"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.rentalIncome
                                        .toString(),
                                    labelText: "Rental Income"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<IletsModel>(
              future: getFunction.getIletsModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'ILETS/ TOFEL/ CELPIP',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.iletsClearedFrom
                                        .toString(),
                                    labelText:
                                        "What have you cleared from the"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.scoredOrBand
                                        .toString(),
                                    labelText:
                                        "How many Scored or Bands did you get"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.iletsPassingDate
                                        .toString(),
                                    labelText: "Passing Date"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.iletsExpiryDate
                                        .toString(),
                                    labelText: "Expiry Date"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<AbroadModel>(
              future: getFunction.getAbroadModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'To Unlock contact information ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'Go Premium',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Previous foreign history',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.howManyTimeYouGoAbroad
                                        .toString(),
                                    labelText:
                                        "How many time you go to Abroad"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.whereAreYouLivingInAbroad
                                        .toString(),
                                    labelText: "Where are you living "),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.typeOfVisaDoYouHave
                                        .toString(),
                                    labelText:
                                        "Which type of visa do you have"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.sponsorshipFromAbroad
                                        .toString(),
                                    labelText:
                                        "Can you take any sponsorship from abroad ?"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.howLongHaveBeenLivingInAbroad
                                        .toString(),
                                    labelText:
                                        "How long have been living in Abroad"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.areYouMakingMoneyInAbroad
                                        .toString(),
                                    labelText:
                                        "Are you making money in Abroad now"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.whenWillYouComeBackFromAbroad
                                        .toString(),
                                    labelText:
                                        "When will you come back from Abroad"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.whereAreYouLivingInAbroad
                                        .toString(),
                                    labelText:
                                        "Where are you living in Abroad"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
          FutureBuilder<PartnerPreferenceModel>(
              future: getFunction.getPartnerPreferenceModel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: [
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Partner Preference',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredCountry.toString(),
                                    labelText: "Preferred Country Name"),

                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.PreferredMarriageWith
                                        .toString(),
                                    labelText: "Preferred Nationality"),
                                CustomTextFieldtoShowData(
                                    data: snapshot.data!.preferredLivingStatus
                                        .toString(),
                                    labelText: "Preferred Living Status"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredWorkingStatus
                                        .toString(),
                                    labelText: "Preferred Working Status"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.PreferredIelts
                                        .toString(),
                                    labelText: "Ielts/Tofel"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredAge
                                        .toString(),
                                    labelText: "Preferred Age"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredHeight
                                        .toString(),
                                    labelText: "Preferred Height"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredHighestQualification
                                        .toString(),
                                    labelText: "Preferred Highest Qualification"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredMaritalStatus
                                        .toString(),
                                    labelText: "Preferred Marital Status"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredBodyType
                                        .toString(),
                                    labelText: "Preferred Body Type"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredComplexion
                                        .toString(),
                                    labelText: "Preferred Complexion"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredDiet
                                        .toString(),
                                    labelText: "Preferred Diet"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredDrinking
                                        .toString(),
                                    labelText: "Drinking"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredSmoking
                                        .toString(),
                                    labelText: "Smoking"),
                                CustomTextFieldtoShowData(
                                    data: snapshot
                                        .data!.preferredMotherTounge
                                        .toString(),
                                    labelText: "Preferred Mother Tongue"),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              const Text(
                                'To Unlock Contact information',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 50, width: 250,
                                  //color: Color(0xff0d47a1),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(40)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => const Color(0xffff5275),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState!.validate();
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Masseges()),
                                      // );
                                    },
                                    child: const Text(
                                      "GO PREMIUM NOW",
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
                      ],
                    ),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding CustomTextFieldtoShowData({String? data, String? labelText}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        style: const TextStyle(
          color: Color(0xff00235a),
        ),

        controller: TextEditingController(text: data),
        decoration: InputDecoration(
          enabled: false,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
          labelText: labelText,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffff5275),
              fontSize: 18),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:immigration/matrimonial/Api/api_config.dart';
import 'package:immigration/matrimonial/Screens/family.dart';
import 'package:immigration/matrimonial/Screens/qualification.dart';
import 'package:immigration/matrimonial/model/Post%20Data/abroad_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/business_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/family_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/ilets_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/marriage_interested_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/partner_prefference_details.dart';
import 'package:immigration/matrimonial/model/Post%20Data/personal_info_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/property_model.dart';
import 'package:immigration/matrimonial/model/Post%20Data/qualification_model.dart';

class PostFunction {
  Dio dio = Dio();
  FirebaseFirestore db = FirebaseFirestore.instance;
  addPlanToDb(){
    int? planId;
    db.collection("extras").doc("plan").get().then((value){
     planId= value.data()!["planId"];
    });
    db.collection("matrimonial").doc("12345").update({"plan":planId}).then((value) {
      print("updated");

    }).catchError((onError){
      print("--------------onerror     $onError--------------");
    });

  }

  postPersonalInfo(dynamic data) async {
    PersonalInfoModel _personalInfoModel = PersonalInfoModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.PERSON_DETAILS_POST,
        data: data);
    print('============${response.data}');
    if (response.statusCode == 200) {
      print("data added!");
    }
  }
  postQualification(dynamic data) async {
    QualificationModel _qualificationModel = QualificationModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.QUALIFICATION_DETAILS_POST,
        data: data);
    print('============${response.data}');
    if (response.statusCode == 200) {
      print("data added!");
    }
  }
  postIlets(dynamic data) async {
    IletsModel _iletsModel = IletsModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.ILETS_DETAILS_POST,
        data: data);
    print('============${response.data}');
    if (response.statusCode == 200) {
      print("data added!");
    }
  }
  postFamily(dynamic data) async {
    FamilyModel _familyModel = FamilyModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.FAMILY_DETAILS_POST,
    data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }
  postAbroad(dynamic data) async {
    AbroadModel _abroadModel = AbroadModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.ABROAD_DETAILS_POST,
        data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }
  postMarriageInterest(dynamic data) async {
    MarriageInterestModel _marriageInterestModel = MarriageInterestModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.MARRIGEINTEREST_DETAILS_POST,
        data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }
  postBusinessDetails(dynamic data) async {
    BusinessModel _businessModel = BusinessModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.BUSINESS_DETAILS_POST,
        data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }

  postPropertyDetails(dynamic data) async {
    PropertyModel _propertyModel = PropertyModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.PROPERTIES_DETAILS_POST,
        data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }

  postPartnerDetails(dynamic data) async {
    PartnerPreferenceModel _partnerPreferenceModel = PartnerPreferenceModel();
    final response = await dio.post(ApiConfig.BASE_URL+ApiConfig.PARTNER_DETAILS_POST,
        data: data);
    print('==============${response.data}');
    if(response.statusCode == 200) {
      print("data added!");
    }
  }
}


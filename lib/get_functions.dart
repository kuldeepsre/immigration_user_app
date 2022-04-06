import 'package:dio/dio.dart';
import 'package:immigration/Models/UserModel.dart';
import 'package:immigration/Models/jobPost.dart';

import 'Models/LuggagePost.dart';
import 'Models/seller_profile_model.dart';
import 'SellerModel/today_deal_seller_model.dart.dart';
import 'api_config.dart';


class GetFunction {
  Dio dio = Dio();
  UserModel? userRequirementModel;
  List<UserModel> userRequirementList = [];
  List<JobPost> jobPostByUserModelList = [];
  JobPost? jobPostByUserModel;

  getInterestedVisitors() {}
  Future<List<UserModel>> getUserRequirement() async {
    Response res =
        await dio.get(ApiConfig.BASE_URL + ApiConfig.REQUIREMENT_POST_GET);
    if (res.statusCode == 200) {
      print(res.data);
      userRequirementList.clear();
      for (var item in res.data) {
        userRequirementModel = UserModel.fromJson(item);
        userRequirementList.add(userRequirementModel!);
      }
    }
    return userRequirementList;
  }

  Future<List<LuggagePost>> getLuggageRequirement() async {
    List<LuggagePost> luggageRequirementList = [];
    LuggagePost luggageRequirementModel;
    Response res =
        await dio.get(ApiConfig.BASE_URL + ApiConfig.LUGGAGEPOST_BY_USER_GET);
    if (res.statusCode == 200) {
      print(res.data);
      luggageRequirementList.clear();
      for (var item in res.data) {
        luggageRequirementModel = LuggagePost.fromJson(item);
        luggageRequirementList.add(luggageRequirementModel);
      }
    }
    return luggageRequirementList;
  }
  Future<SellerProfileModel?> getSellerProfileData(String sId) async {
    List<SellerProfileModel> _sellerProfileModelList = [];
    SellerProfileModel? _sellerProfileModel;
    final response = await dio.get(ApiConfig.BASE_URL +
        ApiConfig.SELLER_PROFILE +
        sId);
    print("--------${response.statusCode}");
    if (response.statusCode == 200) {
      print("--------${response.data}");
      //_sellerModelList = [];
      // final jsonResponse = json.decode(response.data);
      // print("--------$jsonResponse");
      _sellerProfileModel = SellerProfileModel.fromJson(response.data);
      _sellerProfileModelList.add(_sellerProfileModel);
      print("-==--=-=-==-=-=--=-=-=${_sellerProfileModel.accountStatus}");
    }
    return _sellerProfileModel;
  }

  Future<List<TodayDealPostSellerModel>> getTodayDealPostSellerList(String sId) async {
    List<TodayDealPostSellerModel> todayDealPostSellerModelList = [];
    TodayDealPostSellerModel todayDealPostSellerModel;
    Response res = await dio.get(ApiConfig.BASE_URL +
        ApiConfig.TODAY_DEAL_SELLER_GET +
       sId);
    if (res.statusCode == 200) {
      print(res.data);
      todayDealPostSellerModelList.clear();
      for (var item in res.data) {
        todayDealPostSellerModel = TodayDealPostSellerModel.fromJson(item);
        todayDealPostSellerModelList.add(todayDealPostSellerModel);
      }
    }
    return todayDealPostSellerModelList;
  }
  Future<JobPost> getJobPostByUser() async {
    Response res =
        await dio.get(ApiConfig.BASE_URL + ApiConfig.JOB_POST_BY_USER);
    if (res.statusCode == 200) {
      print(res.data);
      jobPostByUserModelList.clear();
      //for (var item in res.data) {
      jobPostByUserModel = JobPost.fromJson(res.data);
      jobPostByUserModelList.add(jobPostByUserModel!);
      //}
    }
    return jobPostByUserModel!;
  }

  getLuggagePostListByUser() async {
    Response res =
        await dio.get(ApiConfig.BASE_URL + ApiConfig.LUGGAGEPOST_BY_USER_GET);
    if (res.statusCode == 200) {
      print(res.data);
    }
  }
}

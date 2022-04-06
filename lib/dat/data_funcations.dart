
import 'package:dio/dio.dart';
import 'package:immigration/Models/seller_model.dart';
import 'package:immigration/Models/seller_profile_model.dart';

import '../api_config.dart';

class DataFunction {
  final String? sId;


   DataFunction({this.sId});

  Dio dio = Dio();
  late List<SellerModel> _sellerModelList;
  List<SellerModel> get sellerModelList => _sellerModelList;
  List<SellerProfileModel> _sellerProfileModelList = [];
  SellerProfileModel? _sellerProfileModel;

  SellerModel? _sellerModel;
  SellerModel? get getSellerModel => _sellerModel;
  Future<SellerModel?> sellerFuture() async {
    try {
      final response =
          await Dio().get(ApiConfig.BASE_URL + ApiConfig.SELLER_LIST);
      _sellerModel = SellerModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    }
    return _sellerModel;
  }

  Future<List<SellerModel>> getSellerList() async {
    final response = await Dio()
        .getUri(Uri.parse(ApiConfig.BASE_URL + ApiConfig.SELLER_LIST+sId!));
    //final data = json.decode(response.data);
    if (response.statusCode == 200) {
      _sellerModelList = [];
      response.data.forEach(
          (seller) => _sellerModelList.add(SellerModel.fromJson(seller)));
    }
    return _sellerModelList;
    //return SellerModel.fromJson(response.data);
    //print(response.data);
  }

  Future<SellerProfileModel?> getSellerProfileData() async {
    final response = await dio
        .getUri(Uri.parse(ApiConfig.BASE_URL + ApiConfig.SELLER_PROFILE+sId!));
    if (response.statusCode == 200) {
      print("--------${response.data}");
      _sellerModelList = [];
      // final jsonResponse = json.decode(response.data);
      // print("--------$jsonResponse");
      _sellerProfileModel = SellerProfileModel.fromJson(response.data);
      _sellerProfileModelList.add(_sellerProfileModel!);
      print("-==--=-=-==-=-=--=-=-=${_sellerProfileModel!.accountStatus}");
    }
    return _sellerProfileModel;
  }
}

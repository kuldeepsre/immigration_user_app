import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:immigration/Models/SellerList.dart';
import 'package:immigration/Models/seller_model.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/screens/MainScreen.dart';
import 'package:immigration/screens/profile.dart';

class SellerLists extends StatefulWidget {
  const SellerLists({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  _SellerListsState createState() => _SellerListsState();
}

class _SellerListsState extends State<SellerLists> {
  late SellerListModel sellerModel;
  List<SellerListModel> sellerListModel = [];

  late final int value = 3;

  Future<List<SellerListModel>> getListData() async {
    log("--------------------------------enter");
    http.Response res = await http.get(Uri.parse(
        "https://frozen-savannah-16893.herokuapp.com/Seller/getList/${widget.type}"));
        log("------------------${res.statusCode}");
    if (res.statusCode == 200) {
      log("-----------api---------------------enter");

      var obj = json.decode(res.body);
      print("----------------------${obj}");
      for (var obj1 in obj) {
        sellerModel = new SellerListModel.fromJson(obj1);

        sellerListModel.add(sellerModel);
      }
    }

// List<SellerList> sellerList=new SellerList.fromJson(obj) as List<SellerList>;

    return sellerListModel;
  }

  Future<void> set() async {
    var res = await http.post(Uri.parse(
        "https://frozen-savannah-16893.herokuapp.com/User/categoryclick/${widget.type}/${FirebaseAuth.instance.currentUser!.uid}"));
    if (res.statusCode == 200) {
      print("Interested" + res.statusCode.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    set();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    sellerListModel.clear();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff0D47A1)),
            tooltip: "Cancel and Return to List",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  MainScreen(0)),
              );
            },
          ),
          actions: [

            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: kBlueColor,
                ))
          ],
          backgroundColor: Colors.white,
          title: Text(
            "Immigration Adda",
            style: TextStyle(color: kBlueColor),
          ),
        ),
        body: FutureBuilder(
            future: getListData(),
            builder: (context, AsyncSnapshot<List<SellerListModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading...."),
                  ],
                ));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: sellerListModel.length,
                    itemBuilder: (context, indx) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        height: SizeConfig.screenHeight! / 5,
                        width: SizeConfig.screenWidth,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                width: SizeConfig.screenWidth! / 3,
                                height: SizeConfig.screenHeight! / 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 5),
                                  child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                                Radius.circular(10)),
                                      ),
                                      child: Image.network(
                                        snapshot.data![indx].profilePicture
                                            .toString(),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 12),
                                        child: Text(
                                          snapshot.data![indx].companyName
                                              .toString(),
                                          style: TextStyle(
                                            color: kBlueColor,
                                            fontSize:
                                                SizeConfig.screenHeight! / 36,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          snapshot.data![indx].city.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.screenHeight! / 46,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(5, (index) {
                                            return Icon(
                                              index < value
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              color: Colors.orange,
                                              size: SizeConfig
                                                      .blockSizeVertical! *
                                                  2,
                                            );
                                          }),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: SizeConfig.safeBlockHorizontal! *
                                            60,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                  onTap: () async {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Profile(
                                                                    sId: snapshot
                                                                        .data![
                                                                            indx]
                                                                        .sId
                                                                        .toString())));
                                                    var res = await http.post(
                                                        Uri.parse(
                                                            "https://frozen-savannah-16893.herokuapp.com/User/SeeMyProfile/hfk/${snapshot.data![indx].sId}"));
                                                    if (res.statusCode == 200) {
                                                      print("mymatch" +
                                                          res.statusCode
                                                              .toString());
                                                    }
                                                  },
                                                  child: StyleButton(
                                                      context, "Details")),
                                              StyleButton(context, "Chat")
                                            ]),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            }));
  }
}

Widget StyleButton(BuildContext context, String title) {
  return Container(
    width: SizeConfig.screenWidth! / 4,
    height: SizeConfig.screenWidth! / 10,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: kBlueColor,
      margin: EdgeInsets.zero,
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.screenHeight! / 35,
            fontWeight: FontWeight.w600),
      )),
    ),
  );
}

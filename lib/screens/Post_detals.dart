import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:immigration/Models/SellerList.dart';
import 'package:immigration/Models/postmodel.dart';
import 'package:immigration/Models/seller_model.dart';
import 'package:immigration/Models/seller_profile_model.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/chat/chat.dart';
import 'package:immigration/screens/profile.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../get_functions.dart';

class PostDetails extends StatelessWidget {
  late final String? pId;

  PostDetails(this.pId);
  _handlePressed(types.User otherUser, BuildContext context) async {
    print("---------$otherUser");
    final room = await FirebaseChatCore.instance.createRoom(otherUser);
    print("----room------$room");

    Navigator.of(context).pop();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
          room: room,
        ),
      ),
    );
  }

  getSIdDetails(String sId) async {
    Dio dio = Dio();
    GetFunction _dataFunction = GetFunction();
    SellerProfileModel? model = await _dataFunction.getSellerProfileData(sId);
    log("--SID------${model!.sId}");

    return model;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SellerProfileModel? model;
    Future<PostModel> getDetails() async {
      var res = await http.get(Uri.parse(
          "https://frozen-savannah-16893.herokuapp.com/Seller/postList/" +
              pId!));
      Map<String, dynamic> result = json.decode(res.body);
      PostModel? postModel;
      if (res.statusCode == 200) {
        postModel = PostModel.fromJson(result);

        model = await getSIdDetails(postModel.sId);
        print("///" + result.toString());
      } else {
        print("not" + res.statusCode.toString());
      }

      return postModel!;
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: kBlueColor,
              ))
        ],
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        title: Text(
          "Immigration Adda",
          style: TextStyle(color: kBlueColor),
        ),
      ),
      body: Container(
        color: lightGray,
        child: FutureBuilder<PostModel>(
          future: getDetails(),
          builder: (context, AsyncSnapshot<PostModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                alignment: Alignment.center,
                color: Colors.white,
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(shrinkWrap: true, children: [
                Container(
                  child: Card(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.network(
                              snapshot.data!.postImage,
                              height: SizeConfig.safeBlockVertical! * 40,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: SizeConfig.screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data!.title,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: kBlueColor,
                          width: SizeConfig.screenWidth,
                          child: Text(
                            snapshot.data!.categories.toUpperCase(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: SizeConfig.screenHeight! / 35,
                                inherit: true,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: SizeConfig.screenWidth,
                            child: Text(
                              snapshot.data!.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight! / 55,
                                  inherit: true,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Profile(sId: model!.sId)));
                  },
                  child: Card(
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          child: Container(
                            height: SizeConfig.safeBlockVertical! * 10,
                            child: CircleAvatar(
                              radius: SizeConfig.safeBlockVertical! * 4,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                model!.profilePicture,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 200,
                          child: Text(
                            model!.companyName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.chat),
                              onPressed: () async {
                                types.User otherUser = await types.User(
                                  firstName: model!.companyName,
                                  id: model!.sId,
                                  imageUrl: model!.profilePicture,
                                );
                                final room = await FirebaseChatCore.instance
                                    .createRoom(otherUser);
                                print("----room------$room");
 
                                Navigator.of(context).pop();
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                      room: room,
                                    ),
                                  ),
                                );
                              }
                              //await _handlePressed(otherUser, context);
                              ,
                            ),
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ]);
            }
            return Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              alignment: Alignment.center,
              color: Colors.white,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

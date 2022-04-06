import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/postmodel.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/api_config.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/screens/Post_detals.dart';

class MyPostListScreen extends StatefulWidget {
  final String uri;
  final String type;
   MyPostListScreen({Key? key, required this.uri, required this.type}) : super(key: key);

  @override
  _MyPostListScreenState createState() => _MyPostListScreenState();
}

class _MyPostListScreenState extends State<MyPostListScreen> {
  var _getData;

  List<dynamic> postModelList = [];
  String uId = "";
  late final int value = 3;


  @override
  void initState() {
    _getData = getListData();
    super.initState();
  }
  Future<List<dynamic>> getListData() async {

    var res = await http.get(Uri.parse(
        widget.uri));
    var obj = json.decode(res.body);
    postModelList.clear();
    for (var obj1 in obj) {
      Map<String, dynamic> user = obj1;
      print("gk33333jglug======" + user.toString());

  postModelList.add(user);

    }
    print("hg.khl===========${postModelList.length}");
// List<SellerList> sellerList=new SellerList.fromJson(obj) as List<SellerList>;

    return postModelList;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
        shrinkWrap: true,
       // physics: NeverScrollableScrollPhysics(),
        children: [
          FutureBuilder(
              future:_getData,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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
                  return Material(
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 25, left: 6, right: 6),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: postModelList.length,
                        itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>PostDetails(snapshot.data![index].pId)));
                            },
                            child: Container(

                                margin: EdgeInsets.only(top: 15),
                                width: SizeConfig.screenWidth!,
                                height: SizeConfig.screenHeight! / 2.1,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(20)),
                                  child: Stack(overflow: Overflow.clip, children: [
                                    Column(
                                      textDirection: TextDirection.ltr,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          widget.type=="luggagePost"?snapshot.data![index]["receiverPersonImage"]:
                                          snapshot.data![index]["postImage"]
                                              ,
                                          height: SizeConfig.screenHeight! / 2.5,
                                          width: SizeConfig.screenWidth,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          width: SizeConfig.screenWidth!,
                                          height: SizeConfig.blockSizeVertical! * 7.6,
                                          alignment: Alignment.center,
                                          child:Text( widget.type=="requirementPost"?
                                            snapshot.data![index]["title"]:
                                          snapshot.data![index]["name"],

                                            style: TextStyle(

                                                color: Colors.black,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    6,

                                                fontWeight: FontWeight.bold,
                                                backgroundColor: Colors.white),
                                          ),
                                        ),

                                      ],
                                    ),

                                  ]),
                                )),
                          );
                        },
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
        ]);
  }
}

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/postmodel.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/api_config.dart';
import 'package:immigration/constants.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/screens/Post_detals.dart';

class FavouritePostListScreen extends StatefulWidget {
  final String uri;
   FavouritePostListScreen({Key? key, required this.uri,}) : super(key: key);

  @override
  _FavouritePostListScreenState createState() => _FavouritePostListScreenState();
}

class _FavouritePostListScreenState extends State<FavouritePostListScreen> {
  var _getData;
  late PostModel postModel;
  List<PostModel> postModelList = [];
  String uId = "";
  late List<bool> checkList=[];
  bool checkFavorite=false;
  late final int value = 3;

  Future<String> SetFavorite(String pId) async {
    var res = await http.delete(Uri.parse(
        ApiConfig.BASE_URL+"User/favoriteDelete/${FirebaseAuth.instance.currentUser!.uid}/$pId"));
    var result=json.decode(res.body);
    checkFavorite=result;
    print("Check Favourite"+result.toString());
    return result.toString();
  }
  @override
  void initState() {
    _getData = getListData();
    super.initState();
  }void Favorite(){
    
  }
  Future<List<PostModel>> getListData() async {

    var res = await http.get(Uri.parse(
        widget.uri));
    var obj = json.decode(res.body);
    print("gkjglug======" + obj.toString());
    postModelList.clear();
    for (var obj1 in obj) {
      postModel = new PostModel.fromJson(obj1);
     // check(postModel.pId);
      print("gkjglug=====ff=" +checkFavorite.toString());
setState(() {
  postModelList.add(postModel);
});
      checkList.add(false);
      if(checkFavorite){

      }else {
        //woh api check kr rha tha
       // post ka method nhui hai yaha
        checkFavorite = false;
      }
    }
    print("hg.khl===========${postModelList.length}");
// List<SellerList> sellerList=new SellerList.fromJson(obj) as List<SellerList>;

    return postModelList;
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            FutureBuilder(
                future:_getData,
                builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
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
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 25, left: 6, right: 6),
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
                                height: SizeConfig.screenHeight! / 1.64,
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
                                          snapshot.data![index].postImage
                                              .toString(),
                                          height: SizeConfig.screenWidth,
                                          width: SizeConfig.screenWidth,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                        Container(
                                          color: kBlueColor,
                                          width: SizeConfig.screenWidth!,
                                          height: SizeConfig.blockSizeVertical! * 4,
                                          alignment: Alignment.center,
                                          child: Text(
                                            snapshot.data![index].categories
                                                .toString().toUpperCase(),

                                            style: TextStyle(

                                                color: Colors.white,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    6,

                                                fontWeight: FontWeight.bold,
                                                backgroundColor: kBlueColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 5),
                                          child: Text(
                                            snapshot.data![index].title.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    SizeConfig.blockSizeVertical! *
                                                        3),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7),
                                          child: Text(
                                            snapshot.data![index].description
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: kBlueColor,

                                              fontSize:
                                                  SizeConfig.screenHeight!/30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Card(
                                        elevation: 8,
                                        margin: EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: GestureDetector(
                                          onTap: (){

                                          },
                                          child: IconButton(
                                            icon:Icon(Icons.favorite),

                                            onPressed: () {
                                              SetFavorite(snapshot.data![index].pId);
                                            this.setState(() {
                                              if(checkList[index]==true){
                                                  checkList[index]=false;
                                                }else{
                                                checkList[index]=true;
                                              }
                                            });

                                            },
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                )),
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ]),
    );
  }
}

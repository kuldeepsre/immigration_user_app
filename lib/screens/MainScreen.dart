import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/listscreens/favouritePostListScreen.dart';
import 'package:immigration/listscreens/postListScreen.dart';
import 'package:immigration/notification.dart';
import 'package:immigration/screens/Home_page.dart';
import 'package:immigration/screens/Post_detals.dart';
import 'package:immigration/screens/UserProfileDetails.dart';
import 'package:immigration/screens/addPostScreen.dart';
import 'package:immigration/screens/chat_bottom_page.dart';

import 'Login.dart';
import 'ProfileScreen.dart';
class MainScreen extends StatefulWidget {
  int? _currentIndex;
  MainScreen(_currentIndex) {
    this._currentIndex = _currentIndex;
  }
  // MainScreen({Key? key,this._currentIndex}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //int selecttap=0;
  static List<Widget> widgetList=<Widget>[
    HomePage(),
    ChatBottomPage(),
    //PostDetails("XosbdVvwzsvnRII7DUoO"),
    AddPost(),
    FavouritePostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/favoritelist/${FirebaseAuth.instance.currentUser!.uid}"),
    ProfileScreen(),


  ];

  Future<bool> _onWillPop() {
    Future<bool> value = Future.value(false);
    setState(() {
      if (widget._currentIndex != 0) {
        /*if (widget._currentIndex == widget.savePrevIndex) {
          value  = Future.value(false);
          widget._currentIndex =  widget._currentIndex! - 1;
          setState(() {});
        } else if (widget.savePrevIndex != null) {
          value  = Future.value(false);
          widget._currentIndex = widget.savePrevIndex;
          setState(() {});
        } else {*/
        value = Future.value(false);
        widget._currentIndex = 0;
        setState(() {});
        // }
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                title: Text('Are you sure you want to exit?'),
                content: Text('Confirm Exit'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      value = Future.value(false);
                      SystemNavigator.pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      value = Future.value(true);
                    },
                  )
                ],
              );
            });
      }
    });
    log("--------${value}");
    return value;
  }

  //bool
  void _onselecte(int index){
    setState((){
      widget._currentIndex=index;
    });
    log("--------${widget._currentIndex}");
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.search,color: kBlueColor,
            )), IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Notify()));
            }, icon: Icon(Icons.notifications_active,color: kBlueColor,
            )),
          ],
          leading: Image.asset("assets/images/logo.png"),
          backgroundColor: Colors.white,
          title: Text("Immigration Adda",
            style: TextStyle(color: kBlueColor),),

        ),
        bottomNavigationBar: ConvexAppBar(
             


//initialActiveIndex: widget._currentIndex== widget._currentIndex?0:widget._currentIndex,
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.white,
          activeColor: widget._currentIndex == widget._currentIndex? kBlueColor:Colors.white,
          color: Colors.black38,

          onTap:_onselecte,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.chat, title: 'Chat'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.favorite, title: 'Favorite'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
        ),
        body: widgetList[widget._currentIndex!.toInt()]
      ),
    );
  }
}


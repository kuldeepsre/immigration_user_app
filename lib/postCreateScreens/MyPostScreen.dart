import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/listscreens/my_postListScreen.dart';
import 'package:immigration/listscreens/postListScreen.dart';
class MyPostScreen extends StatefulWidget {
  const MyPostScreen({Key? key}) : super(key: key);

  @override
  _MyPostScreenState createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: const Text('Immigration Adda'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Text("Requirement"),
              ),
              Tab(
                icon: Text("Job"),
              ), Tab(
                icon: Text("Franchise"),
              ), Tab(
                icon: Text("Luggage"),
              ),],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            MyPostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/MyPost/requirementPost/${FirebaseAuth.instance.currentUser!.uid}", type: 'requirementPost',),
            MyPostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/MyPost/jobPost/${FirebaseAuth.instance.currentUser!.uid}", type: 'jobPost',),
            MyPostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/MyPost/franchisePost/${FirebaseAuth.instance.currentUser!.uid}", type: 'franchisePost',),
            MyPostListScreen(uri: "https://frozen-savannah-16893.herokuapp.com/User/MyPost/luggagePost/${FirebaseAuth.instance.currentUser!.uid}", type: 'luggagePost',),
  ],
        ),
      ),
    );
  }
}

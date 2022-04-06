import 'package:flutter/material.dart';

import '../constants.dart';
class TabBarList extends StatefulWidget {
  const TabBarList({Key? key}) : super(key: key);

  @override
  _TabBarListState createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
            ),

          ],
        ),
      ),
      body:  TabBarView(
        children: <Widget>[

        ],
      ),
    );
  }
}

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Post/fav_post.dart';
import 'package:immigration/matrimonial/Post/post_view.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
import 'package:immigration/matrimonial/Screens/home.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/profile.dart';
import 'package:immigration/matrimonial/Screens/qualification.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  //bool

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selecttap = 0;
  static List<Widget> widgetList = <Widget>[
    const Home(),
    const ChatList(),
    const Status(),
    const FavPost(),
    const ProfileView(),


  ];
  @override
  Widget build(BuildContext context) {
    void _onselecte(int index) {
      setState(() {
        selecttap = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        activeColor: kRedColor,
        color: Colors.black38,
        onTap: _onselecte,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.forward_to_inbox, title: 'Chat'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.favorite, title: 'Favorite'),
          TabItem(icon: Icons.people, title: 'Personal'),
        ],
      ),
      body: widgetList.elementAt(selecttap),
    );
  }
}

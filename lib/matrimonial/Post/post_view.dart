import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/create_profile.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Screens/personal_info.dart';
import 'package:immigration/matrimonial/Screens/profile.dart';
import 'package:immigration/screens/profile.dart';

import '../multi_select.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}


class _PostViewState extends State<PostView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: null,
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.6,
                              child: Card(
                                margin: EdgeInsets.zero,
                                elevation: 8,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MultiImage(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'Images/girl.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 1.6,
                              alignment: Alignment.topRight,
                              width: MediaQuery.of(context).size.width,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(26))),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                          size: 30),
                                    )),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.6,
                                  alignment: Alignment.bottomLeft,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Mishika',
                                      style: TextStyle(
                                          backgroundColor: Colors.black12,
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.7,
                                  alignment: Alignment.bottomLeft,
                                  child: const ImageIcon(
                                    AssetImage('Images/Icons/kingcrown1.png'),
                                    color: Colors.orange,
                                    size: 40,
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.7,
                                  width:
                                      MediaQuery.of(context).size.width / 2.0,
                                  alignment: Alignment.bottomRight,
                                  child: const ImageIcon(
                                    AssetImage(
                                        'Images/Icons/MarriagePalace.png'),
                                    color: Colors.orange,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                '30 Years',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '5.6"',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Soni',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Rajpura',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Text(
                                  'IELTS/TOFEL -',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' 7.5 Bands',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: const [
                                Text(
                                  'Interested for - ',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Canada, U.S.A, Russia, Fizi, \n Australia, New Zealand',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 35, width: 160,
                                //color: Color(0xff0d47a1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                      (states) => const Color(0xffff5275),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PersonalInfo(
                                          )),
                                    );
                                  },
                                  child: const Text(
                                    " View \ Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
SizedBox(width: 2),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 35, width: 160,
                                //color: Color(0xff0d47a1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                      (states) => const Color(0xffff5275),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile(
                                                sId: '0123',
                                              )),
                                    );
                                  },
                                  child: const Text(
                                    "Sent \ Request",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
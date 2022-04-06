import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/ChatData/my_status_view.dart';
import 'package:immigration/matrimonial/ChatData/other_status_view.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/Comments/status_comment.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Screens/home.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
        ChatList(),
        Status(),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          pageView,
        ],
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    //   double height = MediaQuery.of(context).size.height;
    //   double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
        title: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: const Center(
              child: Text(
                'Chat',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadProfilePic()),
                        );
                      },
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage('Images/welcome.png'),
                          radius: 25, //Text
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      child: const Text(
                        'Name',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Masseges()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List postStatusList = [];
  var map;
  String? myImg;
  String? myCaption;
  Timestamp? myCreatedAt;
  bool? isStatusAvail;
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? firstName;
  String? myStatusId;
  String? statusImg;
  String? statusCaption;
  String? statusCreatedAt;

  Map<String, dynamic>? lenthOfStatus;

  String? statusName;

  String? statusId;

  String? statusProfilePic;
  @override
  void initState() {
    getStatus();
    super.initState();
  }

  viewStatus() {}

  isStatusAVail() {
    db
        .collection("post")
        .doc('matrimonial')
        .collection('status')
        .where("mid", isEqualTo: "12345")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          isStatusAvail = element.exists;
        });
      });
    });
  }

  getStatus() async {
    await db
        .collection("post")
        .doc('matrimonial')
        .collection('status')
        .where("mid", isEqualTo: "12345")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        map = element.data();
        setState(() {
          isStatusAvail = element.exists;
          myImg = map["imgUrl"];
          myCaption = map["caption"];
          myCreatedAt = map["createdAt"];
          myStatusId = map["statusId"];
        });
        print("------------$isStatusAvail");
      });
    });
  }

  DateFormat date = DateFormat();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffff5275),
        title: TextButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ChatList()),
              // );
            },
            child: const Center(
              child: Text(
                'Status',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                isStatusAvail == false
                    ? ListTile(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => StatusComments())),
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage: AssetImage('Images/welcome.png'),
                          radius: 25, //Text
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text("My Status"),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 18,
                                )),
                            Text("Add your status"),
                          ],
                        ),
                      )
                    : ListTile(
                        onTap: () async {
                          await db
                              .collection('matrimonial')
                              .doc("0123")
                              .get()
                              .then((value) {
                            setState(() {
                              firstName =
                                  value.data()!["PersonDetails"]["firstName"];
                            });
                            log("----name---   $firstName");
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => MyStatusView(
                                    caption: myCaption,
                                    img: myImg,
                                    date: DateFormat('kk:mm:a')
                                        .format(myCreatedAt!.toDate())
                                        .toString(),
                                    name: firstName,
                                    statusId: myStatusId,
                                  )));
                        },
                        leading: CircleAvatar(
                          backgroundColor: kRedColor,
                          radius: 30,
                          child: ClipOval(
                            child: Image.network(myImg.toString()),
                          ),
                        ),
                        // CircleAvatar(
                        //   foregroundColor: kRedColor,
                        //   backgroundColor: Colors.red,
                        //   child: Image.network(img.toString()),
                        //   radius: 25, //Text
                        // ),
                        title: Text("My Status"),
                        subtitle: Text(DateFormat('kk:mm:a')
                            .format(myCreatedAt!.toDate())
                            .toString()),
                      ),

                // FutureBuilder(
                //     future: db
                //         .collection("post")
                //         .doc('matrimonial')
                //         .collection('status')
                //         .where("mid", isEqualTo: "12345")
                //         .get(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                //             snapshot) {
                //       if (snapshot.connectionState ==
                //           ConnectionState.waiting) {
                //         return Center(child: CircularProgressIndicator());
                //       } else if (snapshot.hasData &&
                //           snapshot.connectionState ==
                //               ConnectionState.done) {
                //         snapshot.data!.docs.forEach((v) {
                //           img = v.data()["imgUrl"];
                //         });
                //         return
                //         ListTile(
                //           onTap: () async {
                //             await db
                //                 .collection('matrimonial')
                //                 .doc("0123")
                //                 .get()
                //                 .then((value) {
                //               setState(() {
                //                 firstName = value.data()!["PersonDetails"]
                //                     ["firstName"];
                //               });
                //               log("----name---   $firstName");
                //             });
                //             Navigator.of(context).push(MaterialPageRoute(
                //                 builder: (_) => MyStatusView(
                //                       caption: caption,
                //                       img: img,
                //                       date: DateFormat('kk:mm:a')
                //                           .format(createdAt!.toDate())
                //                           .toString(),
                //                       name: firstName,
                //                       statusId: statusId,
                //                     )));
                //           },
                //           leading: CircleAvatar(
                //             backgroundColor: kRedColor,
                //             radius: 30,
                //             child: ClipOval(
                //               child: Image.network(img.toString()),
                //             ),
                //           ),
                //           // CircleAvatar(
                //           //   foregroundColor: kRedColor,
                //           //   backgroundColor: Colors.red,
                //           //   child: Image.network(img.toString()),
                //           //   radius: 25, //Text
                //           // ),
                //           title: Text("My Status"),
                //           subtitle: Text(DateFormat('kk:mm:a')
                //               .format(createdAt!.toDate())
                //               .toString()),
                //         );

                //       }
                //       return Center(child: CircularProgressIndicator());
                //     },
                //   ),

                SizedBox(
                  height: 10,
                ),
                Text("Recent Updates"),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: db
                      .collection("post")
                      .doc('matrimonial')
                      .collection('status')
                      .where("mid", isNotEqualTo: "12345")
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      postStatusList.clear();
                      snapshot.data!.docs.forEach((v) {
                        postStatusList.add(v.data());
                        lenthOfStatus = v.data();

                        statusImg = v.data()["imgUrl"];
                        statusCaption = v.data()["caption"];
                        statusName = v.data()["name"];
                        statusId = v.data()["statusId"];
                        statusProfilePic = v.data()["profilePic"];
                      });
                      print(postStatusList[0]["imgUrl"]);
                      return ListView.builder(
                          itemCount: postStatusList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => OtherStatusView(
                                              profilePic: postStatusList[index]
                                                  ["profilePic"],
                                              img: postStatusList[index]
                                                  ["imgUrl"],
                                              date: DateFormat("kk:mm:a")
                                                  .format(postStatusList[index]
                                                          ["createdAt"]
                                                      .toDate())
                                                  .toString(),
                                              caption: postStatusList[index]
                                                  ["caption"],
                                              mId: postStatusList[index]["mId"],
                                              name: postStatusList[index]
                                                  ["name"],
                                              statusId: statusId))),
                                  title: Text(postStatusList[index]["name"]),
                                  leading: CircleAvatar(
                                    backgroundColor: kRedColor,
                                    radius: 30,
                                    child: ClipOval(
                                      child: Image.network(
                                          postStatusList[index]["imgUrl"]),
                                    ),
                                  ),
                                  subtitle: Text(DateFormat("kk:mm:a")
                                      .format(postStatusList[index]["createdAt"]
                                          .toDate())
                                      .toString()),
                                ),
                                Divider(),
                              ],
                            );
                          });
                    }
                    // else if (!snapshot.hasData &&
                    //     snapshot.connectionState == ConnectionState.done) {
                    //   return Text("No Status Here");
                    // }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                FutureBuilder(
                  future: db
                      .collection("post")
                      .doc('matrimonial')
                      .collection('status')
                      .where("mid", isNotEqualTo: "12345")
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      postStatusList.clear();
                      snapshot.data!.docs.forEach((v) {
                        postStatusList.add(v.data());
                        lenthOfStatus = v.data();

                        statusImg = v.data()["imgUrl"];
                        statusCaption = v.data()["caption"];
                        statusName = v.data()["name"];
                        statusId = v.data()["statusId"];
                        statusProfilePic = v.data()["profilePic"];
                      });
                      print(postStatusList[0]["imgUrl"]);
                      return ListView.builder(
                          itemCount: postStatusList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => OtherStatusView(
                                              profilePic: postStatusList[index]
                                                  ["profilePic"],
                                              img: postStatusList[index]
                                                  ["imgUrl"],
                                              date: DateFormat("kk:mm:a")
                                                  .format(postStatusList[index]
                                                          ["createdAt"]
                                                      .toDate())
                                                  .toString(),
                                              caption: postStatusList[index]
                                                  ["caption"],
                                              mId: postStatusList[index]["mId"],
                                              name: postStatusList[index]
                                                  ["name"],
                                              statusId: statusId))),
                                  title: Text(postStatusList[index]["name"]),
                                  leading: CircleAvatar(
                                    backgroundColor: kRedColor,
                                    radius: 30,
                                    child: ClipOval(
                                      child: Image.network(
                                          postStatusList[index]["imgUrl"]),
                                    ),
                                  ),
                                  subtitle: Text(DateFormat("kk:mm:a")
                                      .format(postStatusList[index]["createdAt"]
                                          .toDate())
                                      .toString()),
                                ),
                                Divider(),
                              ],
                            );
                          });
                    }
                    // else if (!snapshot.hasData &&
                    //     snapshot.connectionState == ConnectionState.done) {
                    //   return Text("No Status Here");
                    // }
                    return Center(child: CircularProgressIndicator());
                  },
                ),

                // Row(
                //   children: [
                //     const Center(
                //       child: CircleAvatar(
                //         backgroundColor: Colors.red,
                //         backgroundImage: AssetImage('Images/welcome.png'),
                //         radius: 25, //Text
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     // TextButton(
                //     //   child: const Text(
                //     //     'Name',
                //     //     style: TextStyle(fontSize: 25, color: Colors.black),
                //     //   ),
                //     //   onPressed: () {
                //     //     Navigator.pushReplacement(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //           builder: (context) => const StatusComments()),
                //     //     );
                //     //   },
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


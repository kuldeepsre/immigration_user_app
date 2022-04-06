import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OtherStatusView extends StatefulWidget {
  final String? img;
  final String? date;
  final String? caption;
  final String? mId;
  final String? name;
  final String? statusId;
  final String? profilePic;
  const OtherStatusView(
      {Key? key,
      required this.img,
      required this.date,
      required this.caption,
      required this.mId,
      required this.name,
      required this.statusId,
      required this.profilePic})
      : super(key: key);

  @override
  _OtherStatusViewState createState() => _OtherStatusViewState();
}

class _OtherStatusViewState extends State<OtherStatusView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [Text(widget.name.toString())],
        ),
        // actions: [
        //   TextButton(
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (_) => StatusViewsBy(statusId: widget.statusId)));
        //       },
        //       child: Text("Status Views"))
        // ],
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            maxScale: 10,
            child: Container(
              color: Colors.black,
              height: height,
              width: width,
              child: Image.network(widget.img.toString()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              decoration: BoxDecoration(color: Colors.white10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.caption.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

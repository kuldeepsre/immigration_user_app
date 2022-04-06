import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyStatusView extends StatefulWidget {
  final String? img;
  final String? date;
  final String? caption;
  final String? mId;
  final String? name;
  final String? statusId;
  const MyStatusView(
      {Key? key,
      this.img,
      this.date,
      this.caption,
      this.mId,
      this.name,
      this.statusId})
      : super(key: key);

  @override
  _MyStatusViewState createState() => _MyStatusViewState();
}

class _MyStatusViewState extends State<MyStatusView> {
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
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => StatusViewsBy(statusId: widget.statusId)));
              },
              child: Text("Status Views"))
        ],
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

class StatusViewsBy extends StatefulWidget {
  final String? statusId;
  const StatusViewsBy({Key? key, this.statusId}) : super(key: key);

  @override
  _StatusViewsByState createState() => _StatusViewsByState();
}

class _StatusViewsByState extends State<StatusViewsBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status view by"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("post")
            .doc("matrimonial")
            .collection("status")
            .doc(widget.statusId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile();
          });
        },
      ),
    );
  }
}

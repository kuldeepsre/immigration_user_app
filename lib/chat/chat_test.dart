// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ChatTest extends StatefulWidget {
//   const ChatTest({Key? key}) : super(key: key);

//   @override
//   _ChatTestState createState() => _ChatTestState();
// }

// class _ChatTestState extends State<ChatTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("chat").doc(),
//             builder: (context, snapshot) {
//             return Container();
//           })
//         ],
//       ),
//     );
//   }
// }

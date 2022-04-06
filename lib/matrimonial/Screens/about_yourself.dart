// import 'package:flutter/material.dart';
// import 'package:immigration/matrimonial/ChatData/masseges.dart';
// import 'package:immigration/matrimonial/Screens/business.dart';
// import 'package:immigration/matrimonial/Screens/marriage_interest.dart';
// import 'package:immigration/matrimonial/Screens/personal_info.dart';
// import 'package:immigration/matrimonial/Screens/Plans/plans.dart';
// import 'package:immigration/matrimonial/Screens/welcome_screen.dart';
//
// class AboutYourSelf extends StatefulWidget {
//   const AboutYourSelf({Key? key}) : super(key: key);
//
//   @override
//   _AboutYourSelfState createState() => _AboutYourSelfState();
// }
//
// class _AboutYourSelfState extends State<AboutYourSelf> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffff5275),
//         leading: IconButton(icon: const Icon(Icons.arrow_back),
//           tooltip: "Cancel and Return to List",
//           onPressed: () { Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const MarriageIntereste()),
//           );},
//         ),
//         title:  TextButton(onPressed: (){ Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const WelcomeScreen()),
//         );},
//             child: const Center(
//               child: Text('Immigration Adda',
//                 style:  TextStyle(
//                     fontSize: 18,
//                     color: Colors.white
//                 ),),
//             )),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children:  [
//
//                   const Text('About Yourself',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   const Padding(
//                     padding:  EdgeInsets.all(2.0),
//                     child: TextField(
//                       maxLines: 10,
//                       style: TextStyle(
//                         color: Color(0xff00235a),
//                       ),
//                       decoration:  InputDecoration(
//                         border: UnderlineInputBorder(),
//                       ),
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Container(
//                       height: 50, width: 280,
//                       //color: Color(0xff0d47a1),
//                       decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) => const Color(0xffff5275),
//                           ),
//                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40.0),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) =>  Business()),
//                           );
//                         },
//                         child: const Text(
//                           "Update",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

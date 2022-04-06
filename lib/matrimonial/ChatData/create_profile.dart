// import 'package:flutter/material.dart';
// import 'package:immigration/constants.dart';
// import 'package:immigration/postCreateScreens/pr_score.dart';

// class CreateUrProfile extends StatefulWidget {
//   const CreateUrProfile({ Key? key }) : super(key: key);

//   @override
//   _CreateUrProfileState createState() => _CreateUrProfileState();
// }

// class _CreateUrProfileState extends State<CreateUrProfile> {
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//         body: Column(
//           children: [
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Align(
//             alignment: Alignment.center,
//             child: Image.asset("Images\smile-for-profile.jpg")),
//              ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("Please create your profile ",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: kBlueColor,
//               ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                alignment: Alignment.center,
//                child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateColor.resolveWith(
//                               (states) => const Color(0xff0D47A1),
//                         ),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               PRScore ()));
                               
//                       },
//                       child:  Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             ImageIcon(AssetImage("Images/Icons/open_book.png"),
//                             size: 40,
//                             ),
//                             const Text(
//                               "Please create your profile",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
                      
//                     ),
//            ),
//             ),
//           ],
          
//         ) );
//   }
// }
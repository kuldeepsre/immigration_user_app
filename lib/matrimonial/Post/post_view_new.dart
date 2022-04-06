// import 'package:flutter/material.dart';
// import 'package:immigration/matrimonial/Constants/const.dart';

// class PostViewNew extends StatefulWidget {
//   const PostViewNew({ Key? key }) : super(key: key);

//   @override
//   _PostViewNewState createState() => _PostViewNewState();
// }

// class _PostViewNewState extends State<PostViewNew> {
//   @override
//   Widget build(BuildContext context) {
//     double height= MediaQuery.of(context).size.height;
//         double width= MediaQuery.of(context).size.width;


//     return Scaffold(
//       body: ListView.builder(itemBuilder: (context,index){
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: height*0.75,
//             width: double.infinity,
//             child: Card(
//               elevation: 2,
//               shape: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(15)),
//               child:Stack(
//                 children: [
//                    const Align(
//                      alignment: Alignment.topRight,
//                      child: CircleAvatar(
//                        radius: 40,
//                        backgroundColor: Colors.black,
//                       child: Icon(Icons.favorite_outline_outlined,color: kRedColor,),
//                                      ),
//                    ),
//                    Column(
//                      children: [
//                        Expanded( 
//                          flex: 7,
//                          child: Stack(
//                            children: [
//                              ClipRRect(
//                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
//                                child: Image.asset("Images/girl.png")),
//                              Align(
//                                alignment: Alignment.bottomCenter,
//                                child: Row(children: [
//                                  Row(
//                                    children: const[
//                                      Text("Mishika",style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 24,
//                                      ),),
//                                      ImageIcon(AssetImage("Images/Icons/kingcrown1.png"),),
                                     
//                                    ],
//                                  ),
//                                  const Spacer(),
//                                   const ImageIcon(AssetImage("Images/Icons/MarriagePalace.png"),),
                             
//                                ],),
//                              )
//                            ],
//                          ),),
//                          Align(
//                            alignment: Alignment.center,
//                            child: Expanded(
//                              flex: 3,
//                              child: Column(
//                              children: [
//                                Row(children:const [
//                                   Text(
//                                   '30 Years',
//                                   style: TextStyle(
//                                       color: Colors.red,
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(width: 50),
//                                 Text(
//                                   '5.6"',
//                                   style: TextStyle(
//                                       color: Colors.blue,
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),SizedBox(width: 50),
//                                 Text(
//                                   'Soni',
//                                   style: TextStyle(
//                                       color: Colors.purple,
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),SizedBox(width: 50),
//                                 Text(
//                                   'Rajpura',
//                                   style: TextStyle(
//                                       color: Colors.green,
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold),
//                                 ),
                         
                         
//                                ],)
//                            , Row(children:const [Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               'IELTS/TOFEL 7.5 Bands"',
//                               style: TextStyle(
//                                   color: Colors.teal,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                                              ),
//                            Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               'Interested for:- Canada,U.S.A, Fizi, Russia, Australia, UAE, New Zealand',
//                               style: TextStyle(
//                                   color: Colors.orange,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                                              ),],)
//                              ],
//                            )),
//                          ),
//                      ],
//                    )


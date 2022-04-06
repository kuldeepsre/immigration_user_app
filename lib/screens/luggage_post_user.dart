import 'package:flutter/material.dart';
import 'package:immigration/Models/LuggagePost.dart';
import 'package:immigration/constants.dart';

import '../get_functions.dart';
import 'luggage_post_detail_by_user.dart';


class LuggagePostByUser extends StatefulWidget {
  const LuggagePostByUser({Key? key}) : super(key: key);

  @override
  _LuggagePostByUserState createState() => _LuggagePostByUserState();
}

class _LuggagePostByUserState extends State<LuggagePostByUser> {
  GetFunction _function = GetFunction();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBlueColor,
      appBar: AppBar(
        backgroundColor: kBlueColor,
      ),
      body: FutureBuilder<List<LuggagePost>>(
          future: _function.getLuggageRequirement(),
          builder:
              (context, AsyncSnapshot<List<LuggagePost>> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.connectionState==ConnectionState.done){
               return GridView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.688),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LuggagePostDetailByUser(
                                pId: snapshot.data![index].pId,
                                uId: snapshot.data![index].uId,
                                timing: snapshot.data![index].timing,
                                name: snapshot.data![index].name,
                                fatherName: snapshot.data![index].fatherName,
                                address: snapshot.data![index].address,
                                phoneNo: snapshot.data![index].phoneNo,
                                alternatePhoneNo:
                                snapshot.data![index].alternatePhoneNo,
                                passportNo: snapshot.data![index].passportNo,
                                aadharCard: snapshot.data![index].aadharCard,
                                countryName: snapshot.data![index].countryName,
                                city: snapshot.data![index].city,
                                flightTimeing:
                                snapshot.data![index].flightTimeing,
                                flightNameAndNo:
                                snapshot.data![index].flightNameAndNo,
                                description: snapshot.data![index].description,
                                detailsOfLuggage:
                                snapshot.data![index].detailsOfLuggage,
                                totalWeight: snapshot.data![index].totalWeight,
                                amountOffer: snapshot.data![index].amountOffer,
                                receiverName: snapshot.data![index].receiverName,
                                receiverFatherName:
                                snapshot.data![index].receiverFatherName,
                                receiverPhoneNo:
                                snapshot.data![index].receiverPhoneNo,
                                receiverPassportNo:
                                snapshot.data![index].receiverPassportNo,
                                receiverPersonImage:
                                snapshot.data![index].receiverPersonImage,
                                receiverAddress:
                                snapshot.data![index].receiverAddress)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, left: 4, right: 4),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1636260752405-fffb4bdc34e6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1674&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                //Spacer(),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index].name),
                                      Text(
                                          "From: ${snapshot.data![index].address}"),
                                      Text(
                                          "To: ${snapshot.data![index].receiverAddress}")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();

              }),

      // ListView(
      //   children: [
      //     Card(
      //       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //       elevation: 4,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Expanded(
      //             flex: 3,
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 5),
      //               child: Image.asset("assets/extras/user.jpeg"),
      //             ),
      //           ),
      //           SizedBox(
      //             width: 30,
      //           ),
      //           Expanded(
      //             flex: 7,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "User Name Here",
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 // Text(
      //                 //   "Work Permit",
      //                 //   style: TextStyle(
      //                 //     fontSize: 16,
      //                 //     color: kGreenThemeColor,
      //                 //     fontWeight: FontWeight.w100,
      //                 //   ),
      //                 // ),
      //                 Text(
      //                   "City Name here",
      //                   style: TextStyle(
      //                     fontSize: 16,
      //                     color: Colors.blueGrey,
      //                     fontWeight: FontWeight.w100,
      //                   ),
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   mainAxisSize: MainAxisSize.max,
      //                   children: <Widget>[
      //                     Expanded(
      //                       flex: 4,
      //                       child: Padding(
      //                         padding: const EdgeInsets.only(
      //                             top: 8, right: 8, bottom: 8),
      //                         child: ElevatedButton(
      //                             style: ButtonStyle(
      //                                 backgroundColor:
      //                                     MaterialStateColor.resolveWith(
      //                                         (states) => kGreenThemeColor)),
      //                             onPressed: () {
      //                               Navigator.of(context).push(
      //                                 MaterialPageRoute(
      //                                   builder: (context) =>
      //                                       LuggagePostDetailByUser(),
      //                                 ),
      //                               );
      //                             },
      //                             child: Text(
      //                               "Chat",
      //                               style: TextStyle(fontSize: 18),
      //                             )),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       flex: 6,
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: ElevatedButton(
      //                             style: ButtonStyle(
      //                                 backgroundColor:
      //                                     MaterialStateColor.resolveWith(
      //                                         (states) => kGreenThemeColor)),
      //                             onPressed: () {
      //                               Navigator.of(context).push(
      //                                 MaterialPageRoute(
      //                                   builder: (context) =>
      //                                       LuggagePostDetailByUser(),
      //                                 ),
      //                               );
      //                             },
      //                             child: Text(
      //                               "Post Detail",
      //                               style: TextStyle(fontSize: 18),
      //                             )),
      //                       ),
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:immigration/SizeConfig.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/postCreateScreens/FrenchiseScreen.dart';
import 'package:immigration/postCreateScreens/JobScreen.dart';
import 'package:immigration/postCreateScreens/UserPost.dart';
import 'package:immigration/postCreateScreens/luggageScreen.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: lightGray,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 5),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "POST YOUR REQUIREMENTS",
                      style: GoogleFonts.lato(
                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.1),
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> UserPost() ));
            },
                    child: addPostIten(context, "assets/images/Requirement.png",
                        "Your\nRequirement"),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> JobScreen() ));
                    },
                    child: addPostIten(
                        context, "assets/images/job.png", "job\nRequirements"),
                  ),

                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Franchise() ));
                    },
                    child: addPostIten(context, "assets/images/franchise.png",
                        "Purchase\nfranchise"),
                  ),  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> LuggageScreen() ));
                    },child: addPostIten(context, "assets/images/luggage.png",
                      "luggage\nAdjustment"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget addPostIten(BuildContext buildContext, String image, String title) {
  return Container(
    height: SizeConfig.blockSizeVertical! * 60,
    width: SizeConfig.blockSizeHorizontal! * 10,
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Image.asset(
                  image,
                  width: SizeConfig.screenWidth! / 6,
                )),
            Expanded(
              flex: 3,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenHeight! / 35),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:immigration/constants.dart';
import 'package:immigration/postCreateScreens/pr_score.dart';

class PrStudyScore extends StatefulWidget {
  const PrStudyScore({ Key? key }) : super(key: key);

  @override
  _PrStudyScoreState createState() => _PrStudyScoreState();
}

class _PrStudyScoreState extends State<PrStudyScore> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Column(
          children: [
             Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(74.0),
              child: Image.asset("assets/images/logo.png"),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Check you Score Here",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
               alignment: Alignment.center,
               child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xff0D47A1),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PRScore ()));
                               
                      },
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ImageIcon(AssetImage("Images/Icons/open_book.png"),
                            size: 40,
                            ),
                            const Text(
                              "Study visa Score",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      
                    ),
           ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
               alignment: Alignment.center,
               child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff0D47A1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PRScore ()));
                  },
                   child:  Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                          children: [
                           Icon(Icons.book,
                           size: 30,
                           ),
                            const Text(
                              "Permanent Residence",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                   ),
                ),
           ),
            ),
          
          ],
          
        ) );
  }
}
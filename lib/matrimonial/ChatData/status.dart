import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/Constants/const.dart';

class StatusUpload extends StatefulWidget {
  const StatusUpload({Key? key}) : super(key: key);

  @override
  _StatusUploadState createState() => _StatusUploadState();
}

class _StatusUploadState extends State<StatusUpload> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text('Upload your Image',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
        actions: <Widget>[
          TextButton(onPressed: (){ Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  Masseges()),
          );},
              child: const Text('Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),)),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          color: const Color(0xffff5275),
          height: 45,
          child: const Center(
            child: Text('Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.camera_alt),
        backgroundColor: kRedColor,
        onPressed: () {
          setState(() {
          });
        },
      ),
      body: Stack(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'Images/welcome.png'
                    ),
                    fit: BoxFit.fill
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

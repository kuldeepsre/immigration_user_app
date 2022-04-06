import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immigration/Payment/paytm.dart';
import 'package:immigration/matrimonial/Comments/status_comment.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Screens/home.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/Screens/welcome_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {

  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final pageView = PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
        MarriagePalace(
          crownKing: true,
            isProfilePicVisible: true,
          letsMatchContact: true,
          onAccepted: true,
          replayOtherStatus: true,
          UploadDailyStatus: true,
          title: "Marriage Palace",
          amountDescription: "Marriage Palace Plan",
          validity: "6",
            viewCandidates: "300",
            img: "Images/Icons/MarriagePalace.png",
        price: "5000",
          profilePic: "Unlimited",
          position: "Top",
          razorpayAmount: "500000",
        ),
        MarriagePalace(
          crownKing: false,
          isProfilePicVisible: true,
          letsMatchContact: true,
          onAccepted: false,
          replayOtherStatus: true,
          UploadDailyStatus: true,
          title: "Banquet Hall",
          amountDescription: "Banquet Hall Plan",
          validity: "3",
          viewCandidates: "150",
          img: "Images/Icons/banquet.png",
          price: "3500",
          profilePic: "5 times",
          position: "Middle",
          razorpayAmount: "350000",
        ),
        MarriagePalace(
          crownKing: false,
          isProfilePicVisible: true,
          letsMatchContact: false,
          onAccepted: false,
          replayOtherStatus: false,
          UploadDailyStatus: false,
          title: "Guest House",
          amountDescription: "Guest House Plan",
          validity: "1",
          viewCandidates: "75",
          img: 'Images/Icons/guest.png',
          price: "2000",
          profilePic: "1 times",
          position: "Lower",
          razorpayAmount: "200000",
        ),

        // GuestHouse(),
         FreePlan(),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () {
            { Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
            }
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text('Immigration Adda'),
        actions: <Widget>[
          TextButton(onPressed: (){ Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );},
              child: const Text('Skip',
              style:  TextStyle(
                fontSize: 18,
                color: Colors.white
              ),)),
        ],
      ),
      body: Stack(
        children: [
          pageView,
        ],
      ),
    );
  }
}


class GuestHouse extends StatefulWidget {
  const GuestHouse({Key? key}) : super(key: key);

  @override
  _GuestHouseState createState() => _GuestHouseState();
}

class _GuestHouseState extends State<GuestHouse> {
  Razorpay _razorpay = Razorpay();
  String? orderId;
  String? paymentId;
  String? signature;


  void _showDialog(BuildContext context, String title, String message,
      Function() function) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: function,
                child: Text('OK!'),
              ),
            ],
          ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    orderId = response.orderId;
    paymentId = response.paymentId;
    signature = response.signature;
    // Do something when payment succeeds
    print("---success----${response.orderId}");
    addAppointmentData() async {
      // oldOrNew();


      _showDialog(context, "Success", "Your payment Successful", () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    }
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("---error----${response.message}");
    _showDialog(context, "Error Occured!", "Payement Declined!", () {
      Navigator.of(context).pop();
    });

    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " +
            response.message.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    // _showDialog(context, "Success", "Your payment Succesful");

    print("---wallet----${response.walletName}");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }





  doPayement(String amount) async {
    var options = {
      'key': 'rzp_test_RnbpUAn3ftFDkA',
      'amount': amount,
      'name': 'Immigration Adda',
      'description': 'Plan }',
      'prefill': {'contact': "mobileController.text", 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Center(
                          child: Text('Guest House',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                 Image(image: AssetImage('Images/Icons/guest.png')),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Price :- 2000/-',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Package Valid for 1 Month',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Lower position on match',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('IA Chat Unlimited',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(width: 2,),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Change Profile Pic 1 time',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(width: 2,),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('View Candidates Up-to 75',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Upload Daily Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              ImageIcon(
                                AssetImage('Images/Icons/cross.png'),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Reply to other status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Crown',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text('King',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/kingcrown1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            Text('Queen',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/Queen1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Visible on Accepted',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Lets Match Contact you directly',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      //color: Color(0xff0d47a1),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xffff5275),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          doPayement("500");
                        },
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Banquets extends StatefulWidget {
  const Banquets({Key? key}) : super(key: key);

  @override
  _BanquetsState createState() => _BanquetsState();
}

class _BanquetsState extends State<Banquets> {
  Razorpay _razorpay = Razorpay();
  String? orderId;
  String? paymentId;
  String? signature;


  void _showDialog(BuildContext context, String title, String message,
      Function() function) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: function,
                child: Text('OK!'),
              ),
            ],
          ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    orderId = response.orderId;
    paymentId = response.paymentId;
    signature = response.signature;
    // Do something when payment succeeds
    print("---success----${response.orderId}");
    addAppointmentData() async {
      // oldOrNew();


      _showDialog(context, "Success", "Your payment Successful", () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    }
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("---error----${response.message}");
    _showDialog(context, "Error Occured!", "Payement Declined!", () {
      Navigator.of(context).pop();
    });

    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " +
            response.message.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    // _showDialog(context, "Success", "Your payment Succesful");

    print("---wallet----${response.walletName}");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }





  doPayement() async {
    var options = {
      'key': 'rzp_test_RnbpUAn3ftFDkA',
      'amount': "100",
      'name': 'Immigration Adda',
      'description': 'Plan }',
      'prefill': {'contact': "mobileController.text", 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Center(
                          child: Text('Banquet Hall',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ImageIcon(
                          AssetImage('Images/Icons/banquet.png'),
                          color: kYellowColor,
                          size: 60,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [

                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Price :- 3500/-',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Package Valid for 3 Month',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Middle Position on match',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(Icons.done,
                              color: Colors.green,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('IA Chat Unlimited',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Change Profile Pic 5 times',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(width: 2,),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('View Candidates Up-to 150',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  const [
                              Text('Upload Daily Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Reply to other status ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Crown',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text('King',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/kingcrown1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            Text('Queen',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/Queen1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Visible on Accepted ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              ImageIcon(
                                AssetImage('Images/Icons/cross.png'),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Lets Match Contact you directly',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Icon(
                            Icons.done,
                              size: 30,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      //color: Color(0xff0d47a1),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xffff5275),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          doPayement();
                        },
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MarriagePalace extends StatefulWidget {
  final String? title;
  final String? img;
  final String? price;
  final String? razorpayAmount;
  final String? amountDescription;
  final String? validity;
  final String? position;
  final String? profilePic;
  final String? viewCandidates;
  final bool UploadDailyStatus;
  final bool isProfilePicVisible;
  final bool replayOtherStatus;
  final bool crownKing;
  final bool onAccepted;
  final bool letsMatchContact;

  const MarriagePalace({Key? key,required this.letsMatchContact,required this.onAccepted,required this.replayOtherStatus,this.razorpayAmount,required this.isProfilePicVisible, this.title, this.img,this.price, this.amountDescription, this.validity, this.position, this.profilePic, this.viewCandidates,required this.UploadDailyStatus,required this.crownKing}) : super(key: key);

  @override
  _MarriagePalaceState createState() => _MarriagePalaceState();
}

class _MarriagePalaceState extends State<MarriagePalace> {
  Razorpay _razorpay = Razorpay();
  String? orderId;
  String? paymentId;
  String? signature;


  void _showDialog(BuildContext context, String title, String message,
      Function() function) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: function,
                child: Text('OK!'),
              ),
            ],
          ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    orderId = response.orderId;
    paymentId = response.paymentId;
    signature = response.signature;
    // Do something when payment succeeds
    print("---success----${response.orderId}");
    addAppointmentData() async {
      // oldOrNew();


      _showDialog(context, "Success", "Your payment Successful", () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      });
    }
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("---error----${response.message}");
    _showDialog(context, "Error Occured!", "Payement Declined!", () {
      Navigator.of(context).pop();
    });

    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " +
            response.message.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    // _showDialog(context, "Success", "Your payment Succesful");

    print("---wallet----${response.walletName}");
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  doPayement() async {
    var options = {
      'key': 'rzp_test_RnbpUAn3ftFDkA',
      'amount': widget.razorpayAmount,
      'name': 'Immigration Adda',
      'description': widget.amountDescription,
      'prefill': {'contact': "mobileController.text", 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:  [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Center(
                            child: Text(widget.title.toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: ImageIcon(
                              AssetImage(widget.img.toString()),
                              color: kYellowColor,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [

                           Center(
                             child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Price ${widget.price}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                          ),
                           ),
                           Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Package Valid for ${widget.validity} Month',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('${widget.position} Position on match',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Icon(Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('IA Chat Unlimited',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('Change Profile Pic ${widget.profilePic}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                // SizedBox(width: 2,),
                                Visibility(
                                  visible:true ,
                                  child: (widget.isProfilePicVisible==true)?Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ):ImageIcon(
                                    AssetImage('Images/Icons/cross.png'),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('View Candidates Up-to ${widget.viewCandidates}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:   [
                                Text('Upload Daily Status',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: widget.UploadDailyStatus,
                                  child: (widget.UploadDailyStatus==true)?Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ):ImageIcon(
                                    AssetImage('Images/Icons/cross.png'),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('Reply to other status',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: widget.replayOtherStatus,
                                  child: (widget.replayOtherStatus==true)?Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ):ImageIcon(
                                    AssetImage('Images/Icons/cross.png'),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              Text('Crown',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text('King',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),

                              Text('Queen',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Visibility(
                                visible: widget.crownKing,
                                child: (widget.crownKing==true)?Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 30,
                                ): ImageIcon(
                                  AssetImage('Images/Icons/cross.png'),
                                  color: kYellowColor,
                                  size: 50,
                                ),
                              ),


                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text('Visible on Accepted ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Visibility(
                                  visible: widget.onAccepted,
                                  child: (widget.onAccepted==true)?Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 30,
                                  ):ImageIcon(
                                    AssetImage('Images/Icons/cross.png'),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('Lets Match Contact you directly',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.letsMatchContact,
                                child: (widget.letsMatchContact==true)?Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 30,
                                ):ImageIcon(
                                  AssetImage('Images/Icons/cross.png'),
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 50, width: 280,
                        //color: Color(0xff0d47a1),
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xffff5275),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            doPayement();
                          },
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}




class FreePlan extends StatefulWidget {
  const FreePlan({Key? key}) : super(key: key);

  @override
  _FreePlanState createState() => _FreePlanState();
}

class _FreePlanState extends State<FreePlan> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Center(
                          child: Text('Free Membership',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Price :- 0000/-',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Package Valid for 1 Month',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Lower position on match',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('IA Chat Unlimited',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(width: 2,),
                              ImageIcon(
                                AssetImage('Images/Icons/cross.png'),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Change Profile Pic 1 time',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              // SizedBox(width: 2,),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('View Candidates Up-to 0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Upload Daily Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              ImageIcon(
                                AssetImage('Images/Icons/cross.png'),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Reply to other status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Crown',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text('King',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/kingcrown1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            Text('Queen',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/Queen1.png'),
                              color: kYellowColor,
                              size: 50,
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Visible on Accepted',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text('Lets Match Contact you directly',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ImageIcon(
                              AssetImage('Images/Icons/cross.png'),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50, width: 280,
                      //color: Color(0xff0d47a1),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xffff5275),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>  const Home()),
                          );
                        },
                        child: const Text(
                          "Let's enjoy ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







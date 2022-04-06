// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:immigration/screens/MainScreen.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class Payment extends StatefulWidget {
//   const Payment({Key? key}) : super(key: key);
//
//   @override
//   _PaymentState createState() => _PaymentState();
// }
//
// class _PaymentState extends State<Payment> {
//   Razorpay _razorpay = Razorpay();
//   String? orderId;
//   String? paymentId;
//   String? signature;
//
//
//   void _showDialog(BuildContext context, String title, String message,
//       Function() function) {
//     showDialog(
//       context: context,
//       builder: (ctx) =>
//           AlertDialog(
//             title: Text(title),
//             content: Text(message),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: function,
//                 child: Text('OK!'),
//               ),
//             ],
//           ),
//     );
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     orderId = response.orderId;
//     paymentId = response.paymentId;
//     signature = response.signature;
//     // Do something when payment succeeds
//     print("---success----${response.orderId}");
//     addAppointmentData() async {
//       // oldOrNew();
//
//
//       _showDialog(context, "Success", "Your payment Successful", () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MainScreen(),
//           ),
//         );
//       });
//     }
//   }
//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//     print("---error----${response.message}");
//     _showDialog(context, "Error Occured!", "Payement Declined!", () {
//       Navigator.of(context).pop();
//     });
//
//     Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " +
//             response.message.toString(),
//         toastLength: Toast.LENGTH_SHORT);
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet was selected
//     // _showDialog(context, "Success", "Your payment Succesful");
//
//     print("---wallet----${response.walletName}");
//     Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
//         toastLength: Toast.LENGTH_SHORT);
//   }
//
//
//
//
//
//   doPayement() async {
//     var options = {
//       'key': 'rzp_test_RnbpUAn3ftFDkA,SMqpOMLgX15hyOPidFT3089P',
//       'amount': "100",
//       'name': 'Immigration Adda',
//       'description': 'Plan }',
//       'prefill': {'contact': "mobileController.text", 'email': ''},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ElevatedButton(child: Text('Do Payment'),
//                 onPressed: () {
//                   doPayement();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
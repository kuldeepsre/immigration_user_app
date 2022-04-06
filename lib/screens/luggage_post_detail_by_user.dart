import 'package:flutter/material.dart';
import 'package:immigration/screens/view_image.dart';

import '../constants.dart';


class LuggagePostDetailByUser extends StatefulWidget {
  final String? pId;
  final String? uId;
  final String? timing;
  final String? name;
  final String? fatherName;
  final String? address;
  final String? phoneNo;
  final String? alternatePhoneNo;
  final String? passportNo;
  final String? aadharCard;
  final String? countryName;
  final String? city;
  final String? flightTimeing;
  final String? flightNameAndNo;
  final String? description;
  final String? detailsOfLuggage;
  final String? totalWeight;
  final String? amountOffer;
  final String? receiverName;
  final String? receiverFatherName;
  final String? receiverPhoneNo;
  final String? receiverPassportNo;
  final String? receiverPersonImage;
  final dynamic? receiverAddress;
  const LuggagePostDetailByUser(
      {Key? key,
      required this.pId,
      required this.uId,
      required this.timing,
      required this.name,
      required this.fatherName,
      required this.address,
      required this.phoneNo,
      required this.alternatePhoneNo,
      required this.passportNo,
      required this.aadharCard,
      required this.countryName,
      required this.city,
      required this.flightTimeing,
      required this.flightNameAndNo,
      required this.description,
      required this.detailsOfLuggage,
      required this.totalWeight,
      required this.amountOffer,
      required this.receiverName,
      required this.receiverFatherName,
      required this.receiverPhoneNo,
      required this.receiverPassportNo,
      required this.receiverPersonImage,
      required this.receiverAddress})
      : super(key: key);

  @override
  _LuggagePostDetailByUserState createState() =>
      _LuggagePostDetailByUserState();
}

class _LuggagePostDetailByUserState extends State<LuggagePostDetailByUser> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ViewImage(
                              image:
                                  "https://images.unsplash.com/photo-1633113087654-c49c686c2cdf?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
                            )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1633113087654-c49c686c2cdf?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: height * 0.5,
                    ),
                  ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  color: kBlueColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Center(
                      child: Text("Luggage Detail",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldForData(
                    dataToShow: widget.detailsOfLuggage,
                    title: "Detail of Luggage",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.totalWeight,
                    title: "Total Weight",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.amountOffer,
                    title: "Amount Offer",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.flightTimeing,
                    title: "Flight Date and Time",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.flightNameAndNo,
                    title: "Flight Name and No.",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.description,
                    title: "Description of Luggage",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: kBlueColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Text("Sender Details",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.name,
                    title: "Name",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.fatherName,
                    title: "Father Name",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.address,
                    title: "Address",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.phoneNo,
                    title: "Mobile No.",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.alternatePhoneNo,
                    title: "Alternate Mobile No.",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.passportNo,
                    title: "Passport No.",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.aadharCard,
                    title: "Aadhar Number",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.countryName,
                    title: "Country Name",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.city,
                    title: "City",
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: kBlueColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Center(
                          child: Text("Receiver Details",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.receiverName,
                    title: "Receiver Name",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.receiverFatherName,
                    title: "Receiver Father Name",
                  ),
                  CustomTextFieldForData(
                    dataToShow: widget.receiverPhoneNo,
                    title: "Receiver Mobile No.",
                  ),
                  // CustomTextFieldForData(
                  //   dataToShow: "dfds",
                  //   title: "Receiver Father Name",
                  // ),
                  CustomTextFieldForData(
                      title: "Receiver Address",
                      dataToShow: widget.receiverAddress),
                  CustomTextFieldForData(
                    dataToShow: widget.receiverPassportNo,
                    title: "Receiver Passport Number",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextFieldForData extends StatelessWidget {
  final String? title;
  final String? dataToShow;
  const CustomTextFieldForData({
    Key? key,
    required this.title,
    required this.dataToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        child: TextFormField(
          controller: TextEditingController(
            text: dataToShow,
          ),
          decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(color: Colors.black, fontSize: 22)),
          readOnly: true,
          style: TextStyle(
            fontSize: 18,
            color: kBlueColor,
          ),
        ),
      ),
    );
  }
}

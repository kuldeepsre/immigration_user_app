import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immigration/Models/seller_profile_model.dart';
import 'package:immigration/SellerModel/today_deal_seller_model.dart.dart';
import 'package:immigration/screens/view_image.dart';

import '../constants.dart';
import '../get_functions.dart';

class Profile extends StatefulWidget {
  final String sId;

  const Profile({
    Key? key,
    required this.sId,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  Dio dio = Dio();
  GetFunction _dataFunction = GetFunction();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: Text("Profile"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: FutureBuilder(
                  future: _dataFunction.getSellerProfileData(widget.sId),
                  builder:
                      (context, AsyncSnapshot<SellerProfileModel?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kBlueColor,
                          ),
                        ),
                      );
                    }
                    // else if (snapshot.hasError) {
                    //   return Center(child: Text(snapshot.error.toString()));
                    // }
                    else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(snapshot.data!.profilePicture)
                                // "https://images.unsplash.com/photo-1593642634315-48f5414c3ad9?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2069&q=80"),
                                ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        enabled: false,
                                        controller: TextEditingController(
                                          text: snapshot.data!.companyName,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Company Name',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: snapshot.data!.address,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Address',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ), Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: snapshot.data!.getaddress,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'City',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: snapshot.data!.phoneNo,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Phone number',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: snapshot.data!.email,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Email id',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Container(
                                      child: TextFormField(
                                        controller: TextEditingController(
                                          text: snapshot.data!.plan,
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Plan',
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 22)),
                                        readOnly: true,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 9,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [      Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 16),
                              child: Text(
                                'About Us',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 18,bottom: 5),
                              child: Text(
                                snapshot.data!.address,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),],
                          ),
                            elevation: 9,
                          ),
                          ),
                        ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [          Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Text('Contact Person & Details',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18.0,bottom: 10
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Contact Person Name:- ${snapshot.data!.contactPersonName}",style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),),
                                        Text(
                                            "Designation:- ${snapshot.data!.roleOfPerson}",style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        ),),
                                        //Text("Mobile No:- ${snapshot.data!.}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 9,
                            ),
                          ),
                          SizedBox(
                          width: MediaQuery.of(context).size.width,
                        child: Card(

                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Text('Deal in this categories',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: List.generate(
                                      snapshot.data!.categories.length,
                                      (index) => Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data!.categories[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: kBlueColor.withOpacity(0.8),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                          elevation: 9,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //color: kBlueColor,
                            //height: 100,
                            child: TabBar(
                              controller: _tabController,
                              //indicatorColor: kBlueColor,

                              //unselectedLabelStyle: TextStyle(color: Colors.white),
                              labelColor: Colors.white,
                              unselectedLabelColor: kBlueColor,
                              automaticIndicatorColorAdjustment: true,
                              isScrollable: true,

                              labelStyle: TextStyle(),

                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                color: kBlueColor,
                              ),

                              tabs: [
                                Tab(
                                  text: 'Posts',
                                ),
                                Tab(
                                  text: 'Certificates',
                                ),
                                Tab(
                                  text: 'Office \nGallery',
                                ),
                                Tab(
                                  text: 'Customer \nReview',
                                ),
                                Tab(
                                  text: 'Previous\nResult',
                                ),
                              ],
                            ),
                          ),
                          Container(

                            height: 500,
                            color: Colors.grey.withOpacity(0.1),
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  FutureBuilder<
                                          List<TodayDealPostSellerModel>>(
                                      future: _dataFunction
                                          .getTodayDealPostSellerList(
                                              widget.sId),
                                      builder: (context,
                                          AsyncSnapshot<
                                                  List<
                                                      TodayDealPostSellerModel>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (snapshot.hasData &&
                                            snapshot.connectionState ==
                                                ConnectionState.done) {
                                          return GridView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.data!.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) => ViewImage(
                                                                image: snapshot
                                                                    .data![
                                                                        index]
                                                                    .postImage)));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0,
                                                            bottom: 4.0,
                                                            left: 4,
                                                            right: 4),
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Image.network(
                                                        snapshot.data![index]
                                                            .postImage,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        }
                                        return Center(
                                            child:
                                                CircularProgressIndicator());
                                      }),
                                  GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.data!.companyImages.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) => ViewImage(
                                                        image: snapshot.data!
                                                                .companyImages[
                                                            index])));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0,
                                                bottom: 4.0,
                                                left: 4,
                                                right: 4),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.network(
                                                snapshot.data!
                                                    .companyImages[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                  GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                          .data!.companyCertification.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        // mainAxisExtent: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              left: 4,
                                              right: 4),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) => ViewImage(
                                                          image: snapshot
                                                                  .data!
                                                                  .companyCertification[
                                                              index])));
                                            },
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.network(
                                                  snapshot.data!
                                                          .companyCertification[
                                                      index],
                                                  height: 100,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        );
                                      }),
                                  GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.data!.reviews.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) => ViewImage(
                                                        image: snapshot.data!
                                                                .reviews[
                                                            index])));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                bottom: 8.0,
                                                left: 4,
                                                right: 4),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.network(snapshot
                                                  .data!.reviews[index]),
                                            ),
                                          ),
                                        );
                                      }),
                                  GridView.builder(
                                      //physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                          .data!.companyCertification.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        // mainAxisExtent: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) => ViewImage(
                                                        image: snapshot.data!
                                                                .companyCertification[
                                                            index])));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                bottom: 8.0,
                                                left: 4,
                                                right: 4),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.network(
                                                  snapshot.data!
                                                      .previousResult[index],
                                                  height: 100,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        );
                                      }),
                                ]),
                          )
                        ],
                      );
                    }
                    //return CircularProgressIndicator();
                  }),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              child: TextButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(1);

                    return kBlueColor.withOpacity(1);
                  },
                )),
                child: Container(
                  height: MediaQuery.of(context).size.width / 14,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Chat".toUpperCase(),
                    style: TextStyle(color: Colors.white,
                    fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

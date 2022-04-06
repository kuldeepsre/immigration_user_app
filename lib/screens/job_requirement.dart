import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immigration/Models/requirementPost.dart';
import 'package:http/http.dart' as http;
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/postCreateScreens/JobScreen.dart';
import 'package:status_alert/status_alert.dart';
import '../SizeConfig.dart';
import '../api_config.dart';
import '../constants.dart';
import 'package:http_parser/http_parser.dart';

class JobRequirement extends StatefulWidget {
  const JobRequirement({Key? key}) : super(key: key);

  @override
  _JobRequirementState createState() => _JobRequirementState();
}

class _JobRequirementState extends State<JobRequirement> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Job Seeker",style: TextStyle(color: kWhiteColor, fontSize: 20,),),),
              Tab(child: Text("Job Offer",style: TextStyle(color: kWhiteColor, fontSize: 20),),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            JobScreen(),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
}


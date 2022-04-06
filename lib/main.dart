import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/upload_profile_pic.dart';
import 'package:immigration/matrimonial/multi_select.dart';
import 'package:immigration/provider/auth_provider.dart';
import 'package:immigration/screens/Home_page.dart';
import 'package:immigration/screens/MainScreen.dart';
import 'package:immigration/screens/SplashScreen.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "segoe"),
        home: MainScreen(0),)
    );
  }
}

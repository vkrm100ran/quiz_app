import 'dart:io';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/screen/profile.dart';
import 'package:quiz_app/screen/quiz_intro.dart';
import 'package:quiz_app/screen/quiz_ques.dart';
import 'package:quiz_app/screen/win.dart';
import 'package:quiz_app/screen/wrong_ques.dart';
import 'package:quiz_app/services/constant.dart';
import 'package:quiz_app/services/localdb.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  print("initializing firebase");
  Platform.isAndroid? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCvL9jyex0JGlLE3L_2R58kVQohvyuUweE",
        appId: "1:1086709623033:android:ea718ae87c0a4d84025a28",
        messagingSenderId: "1086709623033",
        projectId: "kbc-quiz-app-ef014"
    )
  ) : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: Authentication(),
      ),
    );
  }
}


class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
  }

  bool isLogin = false;

  getLoggedInState() async{
    await LocalDB.getLoggedData().then((value){
      setState(() {
        isLogin = value!;
      });
    });

    constant.name = (await LocalDB.getName())!;
    constant.email = (await LocalDB.getEmail())!;
    constant.img = (await LocalDB.getImg())!;

  }

  @override
  Widget build(BuildContext context) {
    return isLogin? Home() : Login();
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/constant.dart';
import 'package:quiz_app/services/localdb.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;

      showSimpleNotification(
        Container(
          height: 20,
          width: 40,
          child: Text(connected ? "connected" : "connection Lost!",
                style: TextStyle(
          color: Colors.black
                ),),
        ),
          background: Colors.white.withOpacity(0.1),
          position: NotificationPosition.bottom,
          elevation: 5,
        duration: Duration(seconds: 3),

      );
    });
  }


  signInMethod(context) async{
    await signInWithGoogle();
    print("signInWith google is successfull ......");
    
    constant.name = (await LocalDB.getName())!;
    constant.email = (await LocalDB.getEmail())!;
    constant.img = (await LocalDB.getImg())!;

    
    print("Name = ${constant.name}, email = ${constant.email}, image = ${constant.img}");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [Colors.blueAccent, Colors.green.withOpacity(0.5), Colors.blueAccent,],
          )
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("image/logo.png"),

              Text("welcome",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontFamily: "Schyler",
              ),
              ),

              Text("To KBC quiz App",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  fontFamily: "Schyler",
                ),
              ),

              SizedBox(height: 20,),

              SignInButton(Buttons.GoogleDark, onPressed: () async{
                await signInMethod(context);
              })


            ],
          ),
        ),
      )


    );
  }
}







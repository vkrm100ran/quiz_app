import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/quiz_ques.dart';

class Win extends StatefulWidget {
  String QuizID;
  int queMoney;
  Win({required this.QuizID, required this.queMoney});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {

  late ConfettiController confettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController(){
    confettiController = ConfettiController(duration: const Duration(seconds: 2));
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/win_background.jpg"), fit: BoxFit.cover, opacity: 0.8
            )
          ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Congratulations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
              ),
        
              Text("Your Answer is Correct",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
              ),
        
              Text("You Won",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
              ),
        
              Text("Rs. ${widget.queMoney}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),
              ),
        
              Container(
                  child: Image.asset("image/cheque.png")),

              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Questions(QuizID: widget.QuizID, queMoney: ((widget.queMoney)*2))));
                print(((widget.queMoney)*2).toString());
                print("this above is quiz money -- -");

              },

                  child: Text("Next",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ))
              
            ],
          ),
        
        ),


          buildConfettiWidget(confettiController, pi / 2)


        ]
      ),

      
    );
  }


  Align buildConfettiWidget(controller, double blastDirection){
    return Align(alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.02,
        numberOfParticles: 20,
        gravity: 0.2,

      ),

    );
  }



}




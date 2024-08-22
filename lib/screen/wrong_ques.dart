import 'dart:ffi';

import 'package:flutter/material.dart';


class Wrong_ques extends StatefulWidget {
  String correctAnswer;
  int wonMoney;

  Wrong_ques({required this.correctAnswer, required this.wonMoney});


  @override
  State<Wrong_ques> createState() => _Wrong_quesState();
}

class _Wrong_quesState extends State<Wrong_ques> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/wrong_bg.png"), fit: BoxFit.cover, opacity: 0.4
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: ElevatedButton(
          onPressed: (){},
          child: Text("Retry"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OH Sorry!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8)

              ),),

              Text("Your Answer is Incorrect",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8)
              ),
              ),


              Text("correct answer is - ${widget.correctAnswer}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8)
                ),
              ),



              Text("You Won",

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8)
              ),),

              Text("Rs. ${widget.wonMoney == 1000? 0 : widget.wonMoney}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8)
                ),
              ),

              SizedBox(height: 20,),

              Icon(Icons.error_outline,
                size: 80,
                  color: Colors.white.withOpacity(0.8)
              ),

              SizedBox(height: 15,),

              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Go To Rewards")
              )



            ],



          ),
        ),


      ),
    );
  }
}





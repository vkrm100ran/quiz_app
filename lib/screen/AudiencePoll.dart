import 'dart:math';

import 'package:flutter/material.dart';


class AudiencePoll extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  
  AudiencePoll({required this.question, required this.opt1, required this.opt2, required this.opt3, required this.opt4, required this.correctAns});

  @override
  State<AudiencePoll> createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {

  bool isVoting = true;

  int opt1Votes = 0;
  int opt2Votes = 0;
  int opt3Votes = 0;
  int opt4Votes = 0;

  vottingMachine(){

    Future.delayed(Duration(seconds: 5), (){
    setState(() {

      if(widget.opt1 == widget.correctAns){
        opt1Votes = Random().nextInt(100);
      }else{
        opt1Votes = Random().nextInt(40);
      }


      if(widget.opt2 == widget.correctAns){
        opt2Votes = Random().nextInt(100);
      }else{
        opt2Votes = Random().nextInt(40);
      }


      if(widget.opt3 == widget.correctAns){
        opt3Votes = Random().nextInt(100);
      }else{
        opt3Votes = Random().nextInt(40);
      }


      if(widget.opt4 == widget.correctAns){
        opt4Votes = Random().nextInt(100);
      }else{
        opt4Votes = Random().nextInt(40);
      }

      isVoting = false;

    });

    Future.delayed(Duration(seconds: 7), (){
      Navigator.pop(context);
    });

  });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vottingMachine();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),

      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 250, horizontal: 20),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 5,),

              Text("Audience Poll LifeLine",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8)
                ),
              ),

              SizedBox(height: 7,),

              Text("Question - ${widget.question}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.8)

                ),
              ),

              SizedBox(height: 10,),

              Text(isVoting ? "Audience is Voting" : "Here are the Results",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8)
                  
                ),
              ),

              SizedBox(height: 10,),


              isVoting ? Padding(
                padding: const EdgeInsets.all(30),
                child: LinearProgressIndicator(),
              ) : Container(),
              
              
              Text("${widget.opt1} \t\t ${opt1Votes} Votes" ,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.8)
                ),
              ),

              SizedBox(height: 5,),

              Text("${widget.opt2} \t\t ${opt2Votes} Votes" ,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.8)
                ),
              ),

              SizedBox(height: 5,),

              Text("${widget.opt3} \t\t ${opt3Votes} Votes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.8)
                ),
              ),

              SizedBox(height: 5,),

              Text("${widget.opt4} \t\t ${opt4Votes} Votes" ,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.8)
                ),
              ),


            ],

          ),
        ),
      ),


    );
  }
}





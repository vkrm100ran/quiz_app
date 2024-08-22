import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:quiz_app/screen/quiz_ques.dart';
import 'package:quiz_app/services/QuizQueCreater.dart';
import 'package:quiz_app/services/buy_quiz.dart';
import 'package:quiz_app/services/checkQuizUnlock.dart';
import 'package:quiz_app/services/localdb.dart';

class QuizIntro extends StatefulWidget {
  String QuizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizId;
  String QuizPrice;

  QuizIntro({
    required this.QuizName,
    required this.QuizImgUrl,
    required this.QuizTopics,
    required this.QuizDuration,
    required this.QuizAbout,
    required this.QuizId,
    required this.QuizPrice

});



  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {

  bool quizIsUnlocked = false;

  getQuizUnlockedStatus() async{
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId).then((value){
      setState(() {
        quizIsUnlocked = value;
      });
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuizUnlockedStatus();
    setLifelineAvalibility();
  }




  setLifelineAvalibility() async{
    await LocalDB.saveAudPoll(true);
    await LocalDB.saveJoker(true);
    await LocalDB.save50Data(true);
    await LocalDB.saveExpData(true);


  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text(quizIsUnlocked ? "Start Quiz" : "Unlock Quiz",
            style: TextStyle(
            fontSize: 20,
          fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.9)
        ),
      ),
      onPressed: () async{
          await quizIsUnlocked ? 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Questions(QuizID: widget.QuizId, queMoney: 2000))) :

          await BuyQuiz.quiz_buying(QuizPrice: int.parse(widget.QuizPrice), Quizid: widget.QuizId).then((quizIsBuy) {
            if( quizIsBuy){
              setState(() {
                quizIsUnlocked = true;
              });
            } else {
              return showDialog(context: context, builder: (context) => AlertDialog(

                title: Text("You Donot have to Enough Money to Buy this Quiz!"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("OK"))
                ],


              ));

            }




          });


      },

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.8)),
        ),
      ),

      appBar: GradientAppBar(
        title: Text("KBC Quiz App",
          style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold
          ),
        ),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFFF0E5E5),
              Color(0xFF80B8FF),
              Color(0xFFE27BFF),
            ]
        ),
        elevation: 10,
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(7, 20, 7, 20),
                child: Column(
                  children: [
                    Text(widget.QuizName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                      textAlign: TextAlign.center,
                    ),
        
                    SizedBox(height: 7,),
                    
                    Image.network(widget.QuizImgUrl,
                      fit: BoxFit.cover,
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                    ),
        
        
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.topic_outlined),
                              SizedBox(width: 6,),
                              Text("Related To -",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
        
                            ],
                          ),
                          Text(widget.QuizTopics,
                            style: TextStyle(
                                fontSize: 17
                            ),
                          )
        
                        ],
                      ),
                    ),
        
        
        
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer),
                              SizedBox(width: 6,),
                              Text("Duration",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
        
                            ],
                          ),
                          Text("${widget.QuizDuration} Minutes",
                            style: TextStyle(
                                fontSize: 17
                            ),
                          )
        
                        ],
                      ),
                    ),
        
        
        
        
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.topic_outlined),
                              SizedBox(width: 6,),
                              Text("About Quiz -",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
        
                            ],
                          ),
                          Text(widget.QuizAbout,
                            style: TextStyle(
                                fontSize: 17
                            ),
                          )
        
                        ],
                      ),
                    ),



                    quizIsUnlocked? Container() : Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.topic_outlined),
                              SizedBox(width: 6,),
                              Text("Rs. - ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                            ],
                          ),
                          Text(widget.QuizPrice,
                            style: TextStyle(
                                fontSize: 17
                            ),
                          )

                        ],
                      ),
                    )






        
        
                  ],
                ),
              )
        
        
            ],
          ),
        ),
      ),


    );
  }
}






import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:quiz_app/screen/win.dart';
import 'package:quiz_app/screen/wrong_ques.dart';
import 'package:quiz_app/services/FireDB.dart';
import 'package:quiz_app/services/QuestionModel.dart';
import 'package:quiz_app/services/QuizQueCreater.dart';

import '../widgets/lifeline_sidedrawer.dart';

class Questions extends StatefulWidget {
  String QuizID;
  int queMoney;

  Questions({required this.QuizID, required this.queMoney});


  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  QuestionModel questionModel = new QuestionModel();

  genQue() async{
    await QuizQueCreater.genQuizQue(widget.QuizID, widget.queMoney.toString()).then((queData){


      setState(() {
        questionModel.question = queData["question"];
        questionModel.correctAnswer = queData["correctAnswer"];

        List options = [
          queData["opt1"],
          queData["opt2"],
          queData["opt3"],
          queData["opt4"],
        ];

        options.shuffle();

        questionModel.option1 = options[0];
        questionModel.option2 = options[1];
        questionModel.option3 = options[2];
        questionModel.option4 = options[3];


      });
      });

  }

  bool optALocked = false;
  bool optBLocked = false;
  bool optCLocked = false;
  bool optDLocked = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genQue();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFC5A521).withOpacity(0.7),
            Color(0xFFDBCC92).withOpacity(0.7),
            Color(0XFFF0E5E5).withOpacity(0.7),
          ]
        ),
        image: DecorationImage(image: AssetImage("image/logo.png"))
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GradientAppBar(
          title: Text(widget.queMoney.toString(),
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,

          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFC5A521).withOpacity(0.9),
                Color(0xFFDBCC92),
                Color(0XFFF0E5E5).withOpacity(0.7),
              ]
          ),
          elevation: 10,
        ),
        drawer: Lifeline_Drawer(question: questionModel.question, opt1: questionModel.option1, opt2: questionModel.option2, opt3: questionModel.option3, opt4: questionModel.option4, correctAns: questionModel.correctAnswer),

        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: ElevatedButton(
          child: Text("Quit Game",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.9)
          ),
          ),
          onPressed: (){},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.8)),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),

                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 12,
                        color: Colors.white.withOpacity(0.7),
                        backgroundColor: Colors.black.withOpacity(0.2),
                      ),

                      Center(
                        child: Text("46",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8)
                        ),
                        ),
                      )

                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  margin: EdgeInsets.fromLTRB(3, 50, 3, 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    questionModel.question,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),


                InkWell(
                  onTap: (){
                    print("this is option A, press long for the selection ---- ");
                  },

                  onLongPress: (){
                    setState(() {
                      optALocked = true;
                      print("long pressed");
                    });

                    
                    Future.delayed(Duration(seconds: 2), () async{

                      if(questionModel.option1 == questionModel.correctAnswer){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Win(QuizID: widget.QuizID ,queMoney: widget.queMoney)));
                        print("your answer is correct ----");
                      }else {

                        await FireDB.updateMoney(widget.queMoney ~/ 2);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrong_ques(correctAnswer: questionModel.correctAnswer, wonMoney: widget.queMoney ~/2  )));
                        print("your answer is wrong -------");
                      }


                    });


                  },


                  child: Container(
                    margin: EdgeInsets.fromLTRB(3, 25, 3, 10),
                    decoration: BoxDecoration(
                        color: optALocked? Colors.blue.withOpacity(0.5) : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "A. ${questionModel.option1}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white.withOpacity(0.8)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),


                
                
                
                

                InkWell(
                  onTap: (){
                    print("this is option A, press long for the selection ---- ");
                  },

                  onLongPress: (){
                    setState(() {
                      optBLocked = true;
                      print("long pressed");
                    });


                    Future.delayed(Duration(seconds: 2), () async{

                      if(questionModel.option2 == questionModel.correctAnswer){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Win(QuizID: widget.QuizID ,queMoney: widget.queMoney)));
                        print("your answer is correct ----");
                      }else{
                        await FireDB.updateMoney(widget.queMoney ~/ 2);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrong_ques(correctAnswer: questionModel.correctAnswer, wonMoney: widget.queMoney ~/2  )));
                        print("your answer is wrong -------");
                      }


                    });


                  },



                  child: Container(
                    margin: EdgeInsets.fromLTRB(3, 25, 3, 10),
                    decoration: BoxDecoration(
                        color: optBLocked? Colors.blue.withOpacity(0.5) : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "B. ${questionModel.option2}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white.withOpacity(0.8)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),








                InkWell(
                  onTap: (){
                    print("this is option A, press long for the selection ---- ");
                  },

                  onLongPress: (){
                    setState(() {
                      optCLocked = true;
                      print("long pressed");
                    });


                    Future.delayed(Duration(seconds: 2), () async{

                      if(questionModel.option3 == questionModel.correctAnswer){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Win(QuizID: widget.QuizID ,queMoney: widget.queMoney)));
                        print("your answer is correct ----");
                      }else{
                        await FireDB.updateMoney(widget.queMoney ~/ 2);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrong_ques(correctAnswer: questionModel.correctAnswer, wonMoney: widget.queMoney ~/2  )));
                        print("your answer is wrong -------");
                      }


                    });


                  },



                  child: Container(
                    margin: EdgeInsets.fromLTRB(3, 25, 3, 10),
                    decoration: BoxDecoration(
                        color: optCLocked? Colors.blue.withOpacity(0.5) : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "C. ${questionModel.option3}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white.withOpacity(0.8)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),








                InkWell(
                  onTap: (){
                    print("this is option A, press long for the selection ---- ");
                  },

                  onLongPress: (){
                    setState(() {
                      optDLocked = true;
                      print("long pressed");
                    });


                    Future.delayed(Duration(seconds: 2), () async{

                      if(questionModel.option4 == questionModel.correctAnswer){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Win(QuizID: widget.QuizID ,queMoney: widget.queMoney)));
                        print("your answer is correct ----");
                      }else{
                        await FireDB.updateMoney(widget.queMoney ~/ 2);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrong_ques(correctAnswer: questionModel.correctAnswer, wonMoney: widget.queMoney ~/2  )));
                        print("your answer is wrong -------");
                      }


                    });


                  },



                  child: Container(
                    margin: EdgeInsets.fromLTRB(3, 25, 3, 10),
                    decoration: BoxDecoration(
                        color: optDLocked? Colors.blue.withOpacity(0.5) : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "D. ${questionModel.option4}",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white.withOpacity(0.8)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )




              ],
            ),
          ),
        ),


      ),
    );
  }
}




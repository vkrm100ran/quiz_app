import 'package:cloud_firestore/cloud_firestore.dart';



class QuizQueCreater{


  static Future<Map> genQuizQue(String quizID, String queMoney) async{

    late Map queData;
    
    await FirebaseFirestore.instance.collection("quizzes").doc(quizID).collection("questions").where("money", isEqualTo: queMoney).get().then((value){
      queData = value.docs.elementAt(1).data();
    });

    print(queData);


    return queData;



  }




}


















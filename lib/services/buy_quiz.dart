import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';



class BuyQuiz{


  static Future<bool> quiz_buying({required int QuizPrice, required String Quizid}) async{                       // here we make these optional named parameter, by this we pass these parameters by using their names ----
    String userId = "";
    bool isMoney = false;

    await LocalDB.getUserId().then((uId){
      userId = uId!;
    });

    // try{
    await FirebaseFirestore.instance.collection("users").doc(userId).get().then((user){
      isMoney = QuizPrice <= int.parse(user.data()!["money"]);
    });

    // } catch(e){
    //   print("error is generate in this part of code ----------- ${e}");
    // }


    if(isMoney){
      await FirebaseFirestore.instance.collection("users").doc(userId).collection("unlocked_quiz").doc(Quizid).set({
        "unlocked_at" : DateTime.now()
      });
      print("quiz is successfully unlocked and addded in database  -------  ");

      return true;
    }else{
      print("money is not valid to buy this quiz -------- ");
      print("another error also can be in the code -------- ");
      return false;
    }




  }






}






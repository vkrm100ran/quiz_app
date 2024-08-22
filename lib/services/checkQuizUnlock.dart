import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';


class CheckQuizUnlock{


  static Future<bool> checkQuizUnlockStatus(quiz_doc_id) async{
    String user_id = "";
    bool unlocked = false;


      await LocalDB.getUserId().then((value) {
        user_id = value!;
        print("this below is the user_id of the user  -----------");
        print(user_id);
      });






    await FirebaseFirestore.instance.collection("users").doc(user_id).collection("unlocked_quiz").doc(quiz_doc_id).get().then((value){


      print(value.data());

      unlocked = value.data().toString() != "null";




    });

    return unlocked;

  }





}




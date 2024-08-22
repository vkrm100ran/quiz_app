import 'package:cloud_firestore/cloud_firestore.dart';


class HomeFire{
  static Future<List<Map<String, dynamic>>> getQuizzes() async{
    List<Map<String, dynamic>> all_Quizzes = [];

    await FirebaseFirestore.instance.collection("quizzes").get().then((querySnapshot){
      querySnapshot.docs.forEach((quiz) {
        Map<String, dynamic> my_Quiz = quiz.data();

        my_Quiz["QuizId"] = quiz.reference.id;                  // this is the id which we name the collection -- like in this case -- JEE, UPSC -

        // print("these are my quizes  --------------- ");
        // print(my_Quiz);
        // print("this is QuizId, that in which we store the quiz reference id");
        // print(my_Quiz["QuizId"]);
        //print(quiz.data());


        all_Quizzes.add(my_Quiz);

      });

    });

    return all_Quizzes;


  }





}








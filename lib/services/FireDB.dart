import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/services/localdb.dart';

class FireDB{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name , String email , String photoUrl , String uid) async{
    final User? current_user = _auth.currentUser;
    if(await getUser()){
      print("USER ALREADY EXISTS");
    }else{
      await FirebaseFirestore.instance.collection("users").doc(current_user!.uid).set(
          {
            "name" : name,
            "email" : email,
            "photoUrl" : photoUrl,
            "money" : "0",
            "rank" : "NA",
            "level" : "0"
          }
      ).then((value) async {
        await LocalDB.saveMoney("0");
        await LocalDB.saveRank("NA");
        await LocalDB.saveLevel("0");
        print("User Registered Successfully");

      });

    }

  }







  static updateMoney(int amount) async{
    final FirebaseAuth _myAuth = FirebaseAuth.instance;


    if(amount != 1000) {
      await FirebaseFirestore.instance.collection("users").doc(
          _myAuth.currentUser!.uid).get().then((value) async {
        // await LocalDB.saveMoney(
        //     (int.parse(value.data()!["money"]) + amount).toString());
        // print("money is successfully updated in localdatabase ------");
        await FirebaseFirestore.instance.collection("users").doc(
            _myAuth.currentUser!.uid).update({
          "money": (int.parse(value.data()!["money"]) + amount).toString()
        });
      });
      print("money is updated successfully in firebase --- --------");

    }
    // -------   updated data in localdatabase -----
    await FirebaseFirestore.instance.collection("users").doc(_myAuth.currentUser!.uid).get().then((value) async{
      await LocalDB.saveMoney(value.data()!["money"]);
      print("now this is upadted money in local database with new method  -----------  ");
      print(value.data()!["money"]);
    });


  }








  Future<bool> getUser() async{
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance.collection("users").doc(current_user!.uid).get().then((value) async {
      user = value.data().toString();
      print(user);
    });
    if(user.toString() == "null"){
      return false;
    }else{
      await FirebaseFirestore.instance.collection("users").doc(current_user.uid).get().then((value) async {
        user = value.data().toString();
        print(user);
        await LocalDB.saveMoney(value["money"]);
        await LocalDB.saveRank(value["rank"]);
        await LocalDB.saveLevel(value["level"]);
      });
      return true;
    }
  }






}












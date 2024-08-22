import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static final uidKey = "sjffdsf";
  static final nameKey = "csvzxc";
  static final imgKey = "cscsdc";
  static final emailKey = "sdvxx";
  static final logKey = "sccvxzs";
  static final moneyKey = "asdad";
  static final levelKey = "sfdsf";
  static final rankKey = "sfsaaf";

  static final audKey = "sccvdvxhfdsxzs";
  static final jokerKey = "dfdvmdg ";
  static final f50Key = "sfdslrhmgdf";
  static final expKey = "sfsamdvkfefaf";



  // store userId in localdatabase ---
  static Future<bool> saveUserId(String uid) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  // get userId from localdatabase---
  static Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }


  // ---- save name in loacaldatabase ---
  static Future<bool> saveName(String name) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, name);
  }

  //  ------- save mail in lacaldatabase ----
  static Future<bool> saveEmail(String email) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, email);
  }


  // --- -- save img in localdatabase ----
  static Future<bool> saveImg(String img) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(imgKey, img);
  }

  // ------  save money in local database --
  static Future<bool> saveMoney(String money) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(moneyKey, money);
  }

  // ------  save rank in local database - ---
  static Future<bool> saveRank(String rank) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rankKey, rank);
  }

  /// ------  save level in localdatabase  ----
  static Future<bool> saveLevel(String level) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(logKey, level);
  }








  // ----  get name from localdatabase ----
  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKey);
  }

  // ----- get email from localdatabase ----
  static Future<String?> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
  }

  //  -----  get img from localdatabase ----
  static Future<String?> getImg() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(imgKey);
  }

  // ---- get money from localDatabase----
  static Future<String?> getMoney()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(moneyKey);
  }

  // ---- get rank from localDatabase----
  static Future<String?> getRank() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rankKey);
  }

  // ---- get level from localDatabase----
  static Future<String?> getLevel() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(levelKey);
  }




  //  ----  keep user login ----
  //   ----- save login data ---
  static Future<bool?> saveLoginData(bool isUserLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn);
  }

  //  ---  get login data ----
  static Future<bool?> getLoggedData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(logKey);
  }






  //   ----- save Audience Poll ---
  static Future<bool?> saveAudPoll(bool isAudPoll) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(audKey, isAudPoll);
  }

  //  ---  get Aud Poll data ----
  static Future<bool?> getAudPoll() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(audKey);
  }


  //   ----- save Joker data ---
  static Future<bool?> saveJoker(bool isJoker) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(jokerKey, isJoker);
  }

  //  ---  get Joker data ----
  static Future<bool?> getJoker() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(jokerKey);
  }




  //   ----- save 50 50 data ---
  static Future<bool?> save50Data(bool is50) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(f50Key, is50);
  }

  //  ---  get 50 50 data ----
  static Future<bool?> get50Data() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(f50Key);
  }



  //   ----- save Expire data ---
  static Future<bool?> saveExpData(bool isExp) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(expKey, isExp);
  }

  //  ---  get Expire data ----
  static Future<bool?> getExpData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(expKey);
  }










}




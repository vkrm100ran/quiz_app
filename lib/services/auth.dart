import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/services/FireDB.dart';
import 'package:quiz_app/services/localdb.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


Future<User?> signInWithGoogle() async{
  try{
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;


    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    User? user = userCredential.user;


    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(user);
    
    await FireDB().createNewUser(user!.displayName.toString(), user.email.toString(), user.photoURL.toString(), user.uid.toString());



    /// save data in the localdatabase ---
    LocalDB.saveLoginData(true);
    LocalDB.saveName(user.displayName.toString());
    LocalDB.saveImg(user.photoURL.toString());
    LocalDB.saveEmail(user.email.toString());
    LocalDB.saveUserId(user.uid.toString());


    print("data in local database is saved successfully ------------------------");



    return user;



  }catch(e){
    print("error occured during the signIn process ${e}");
  }

}


// ---- signOut Button  -----

Future<String> signOut() async{
  await googleSignIn.signOut();
  await _auth.signOut();
  LocalDB.saveLoginData(false);
  return "signOut successfully ----------............";

}



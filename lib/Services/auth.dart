import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firestore/Models/User.dart';
import 'package:flutter_firestore/Services/DataBase.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  //create User Using fireBase User Response
  MyUser _UserFromFirebase(User user){
    return user!=null? MyUser(uid:user.uid):null;
    }
   //auth change user stream

  Stream<MyUser> get userFunction{
    return _auth.authStateChanges().map(_UserFromFirebase);
  }


  Future signInAnon() async{
    try{

      UserCredential result=await _auth.signInAnonymously();
      User user=result.user;
      return _UserFromFirebase(user);

    }
    catch(e){
      print(e.toString());return null;
    }

  }
 //sign out
Future signOut() async{
    try{
      return await _auth.signOut();

    }
    catch(e){
      print(e.toString());
      return null;
    }
    // register with email

}
  Future signInWithEmailAndPass(String email,String password) async{
    try{
      UserCredential  result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User fireBaseUser=result.user;
      return _UserFromFirebase(fireBaseUser);
    }
    catch(e){
    print(e.toString());
    return null;
    }

  }

  //sign in  with email and pass
  Future registerWithEmailAndPass(String email,String password) async{
    try{
      UserCredential  result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User fireBaseUser=result.user;
      //create new account for the user with uid
      await DatabaseService(uid: fireBaseUser.uid).updateUserData('0', 'new crew member', 100);
      return _UserFromFirebase(fireBaseUser);
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }


}
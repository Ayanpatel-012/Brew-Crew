import 'package:flutter/material.dart';
import 'package:flutter_firestore/SCREENS/Authenticate/Register.dart';
import 'package:flutter_firestore/SCREENS/Authenticate/Sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
bool showSignIn=true;
void toggleView(){
  setState(() {
    showSignIn =!showSignIn;
  });
}
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return showSignIn?SignIn(toggleView: toggleView):Register(toggleView:toggleView);
  }
}


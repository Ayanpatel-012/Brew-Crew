import 'package:flutter/material.dart';
import 'package:flutter_firestore/Models/User.dart';
import 'package:flutter_firestore/SCREENS/Authenticate/Authentication.dart';
import 'file:///C:/Users/User/Downloads/flutter_firestore/lib/Home/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    final user=Provider.of<MyUser>(context);
  if(user==null) return Authenticate();
  else {
    return Home();
  }

   }
}

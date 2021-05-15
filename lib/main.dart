import 'package:flutter/material.dart';
import 'package:flutter_firestore/Models/User.dart';
import 'package:flutter_firestore/SCREENS/Wrapper.dart';
import 'package:flutter_firestore/Services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return StreamProvider<MyUser>.value(
      value: AuthService().userFunction,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

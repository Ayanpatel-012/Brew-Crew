import 'package:flutter/material.dart';
import 'package:flutter_firestore/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firestore/shared/Loading.dart';
import 'package:flutter_firestore/shared/constants.dart';
class Register extends StatefulWidget {
  final Function toggleView ;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService  _authService=AuthService();
  final _formKey=GlobalKey<FormState>();

  String email='';
  String password='';
  String error='';
  bool Loadingch=false;
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Loadingch?Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed:  (){
              widget.toggleView();
            },
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
               decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=> val.isEmpty?'Enter an email': null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val)=> val.length<6?'Enter a password with minimum 7 characters ': null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });

                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                 if(_formKey.currentState.validate()){
                   Loadingch=true;
                  dynamic result=await _authService.registerWithEmailAndPass(email, password);

                 if(result==null){

                   setState(() {
                     error='Please supply a valid email';
                     Loadingch=false;
                   });
                 }
                }},

              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              )

            ],
          ),

        ),
      ),
    );
  }
}

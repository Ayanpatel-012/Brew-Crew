
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore/Home/settings_form.dart';
import 'package:flutter_firestore/Models/Brew.dart';
import 'package:flutter_firestore/Services/DataBase.dart';
import 'package:flutter_firestore/Services/auth.dart';
import 'package:provider/provider.dart';

import 'Brew_List.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
   void  _showSettingsPanel(){
     showModalBottomSheet(context: context, builder: (context){
       return Container(
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
           child: SettingsForm(),
         ),
       );
     });
   }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
                icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: ()=> _showSettingsPanel(),

            ),

          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assests/cofee.png'),
                fit: BoxFit.cover,
              ),
            ),

            child: BrewList()),
      ),
    );
  }
}
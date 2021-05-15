
import 'package:flutter/material.dart';
import 'package:flutter_firestore/Models/Brew.dart';
import 'package:provider/provider.dart';

import 'Brew_Tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context)?? [];


    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){
        return BrewTile(brew: brews[index]);
      },

    );
  }
}
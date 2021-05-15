import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore/Models/Brew.dart';
import 'package:flutter_firestore/Models/User.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){

      return Brew(
          name: doc.data()['name'] ?? '0' ,
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0',
      );
    }).toList();
  }
  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
      name: snapshot.data()['name'] ?? '0' ,
      strength: snapshot.data()['strength'] ?? 0,
      sugars: snapshot.data()['sugars'] ?? '0',
    );
  }

  // get brews stream
  Stream<List<Brew>> get brews {

    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);


  }
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}
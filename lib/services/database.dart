import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sample/services/auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference

  final CollectionReference shoeCart =
      FirebaseFirestore.instance.collection('shoes');
  final CollectionReference db =
      FirebaseFirestore.instance.collection('profile');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future updateUserData(
    String assetName,
    String name,
    String price,
    String descript,
    String id,
    List sizes,
    int quantity,
  ) async {
    //update cart  , access provider cart

    //Linking doc with the user
    return await shoeCart.doc(uid).set({
      'assetName': assetName,
      'name': name,
      'price': price,
      'descript': descript,
      'id': id,
      'sizes': sizes,
      'quantity': quantity
    });
  }

  Stream<QuerySnapshot> get shoes {
    return shoeCart.snapshots();
  }

  //Getting shoe cart stream
  Stream<QuerySnapshot> get getShoeCart {
    final snapshot = FirebaseFirestore.instance
        .collection("shoes")
        .doc(uid)
        .collection("shoeCart")
        .snapshots();
    return snapshot;
  }

  Future<String> getUID() async {
    AuthService _auth = await new AuthService();
    final uid = await _auth.getUID();
    return Future.value(uid);
  }

  //Profile
  void addName(String name) {
    User user = _auth.currentUser;
    db.doc(user.uid).set({'name': name});
  }

  Future<String> getName() async {
    User user = _auth.currentUser;
    var document = await db.doc(user.uid).get();
    if (document.exists) {
      var name = document.get('name');
      return name;
    }
    return "";
  }
}

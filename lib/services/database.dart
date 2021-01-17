import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/products.dart';
import 'package:sample/notifiers/ProductNotifier.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference shoeCart = Firestore.instance.collection('shoes');

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
    return await shoeCart.document(uid).setData({
      'assetName': assetName,
      'name': name,
      'price': price,
      'descript': descript,
      'id': id,
      'sizes': sizes,
      'quantity': quantity
    });
  }

  //get shoe stream
  Stream<QuerySnapshot> get shoes {
    return shoeCart.snapshots();
  }
}

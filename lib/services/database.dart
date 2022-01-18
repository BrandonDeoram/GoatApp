import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference shoeCart =
      FirebaseFirestore.instance.collection('shoes');

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

  //get shoe stream
  Stream<QuerySnapshot> get shoes {
    return shoeCart.snapshots();
  }
}

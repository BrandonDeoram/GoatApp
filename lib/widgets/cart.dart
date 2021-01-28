import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/products.dart';
import 'package:sample/notifiers/ProductNotifier.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/cart_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    ProductNotifier listShoe = Provider.of<ProductNotifier>(context);
    total = listShoe.totalPrice;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Container(
          padding: const EdgeInsets.only(left: 75),
          child: Text(
            'Cart',
            style: TextStyle(letterSpacing: 2, fontStyle: FontStyle.normal),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildContainer(listShoe),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          color: Colors.black,
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              child: Consumer<ProductNotifier>(
                builder: (context, pro, child) {
                  return Text(
                    "Total: \$" "$total",
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              width: 100,
              child: FlatButton(
                splashColor: Colors.white,
                onPressed: () {
                  listShoe.clearCart();
                },
                child: Text(
                  "Clear Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(listShoe) {
    return Container(
      child: StreamBuilder(
          stream: getUserStreamSnap(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data.documents.isEmpty) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Cart is Empty',
                  style: TextStyle(fontSize: 20, letterSpacing: 3),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.documents.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2,
                crossAxisSpacing: 100,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => CartCard(
                snapshot.data.documents[index],
                () {},
                index,
              ),
            );
          }),
    );
  }

  Stream<QuerySnapshot> getUserStreamSnap() async* {
    AuthService _auth = new AuthService();
    final uid = await _auth.getUID();
    yield* Firestore.instance
        .collection("shoes")
        .document(uid)
        .collection("shoeCart")
        .snapshots();
  }
}

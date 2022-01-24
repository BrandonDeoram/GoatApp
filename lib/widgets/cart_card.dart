import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sample/services/auth.dart';

class CartCard extends StatefulWidget {
  final DocumentSnapshot listShoe;
  final Function press;
  final int index;
  const CartCard(this.listShoe, this.press, this.index);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    ShapeBorder shape;
    return Container(
      height: 120,
      width: 100,
      child: Card(
        borderOnForeground: true,
        elevation: 0.2,
        color: Colors.white,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 280,
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.listShoe['price'],
                      textScaleFactor: .8,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 140),
                    child: IconButton(
                      splashColor: Colors.blue,
                      onPressed: () async {
                        deleteShoe(context);
                      },
                      icon: Icon(Icons.delete),
                      iconSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(widget.listShoe['name'],
                      style: TextStyle(color: Colors.black)),
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
            Container(
              height: 140,
              width: 300,
              //color: Colors.red,
              padding: EdgeInsets.fromLTRB(75, 0, 10, 0),
              child: InkWell(
                child: Container(
                  height: 100,
                  child: Image.network(
                    widget.listShoe['assetName'],
                    fit: BoxFit.contain,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("x" + widget.listShoe['quantity'].toString()),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }

  Future deleteShoe(context) async {
    AuthService _auth = new AuthService();
    final uid = await _auth.getUID();
    final doc = FirebaseFirestore.instance
        .collection("shoes")
        .doc(uid)
        .collection("shoeCart")
        .doc(widget.listShoe.id);
    int quantity = widget.listShoe['quantity'];
    quantity--;
    if (widget.listShoe['quantity'] > 1) {
      doc.update({"quantity": quantity});
    } else {
      return await doc.delete();
    }
  }
}

//TO:DO Remove Shoe
// Stream<QuerySnapshot> deleteShoe(DocumentSnapshot listShoe) async* {
//   AuthService _auth = new AuthService();
//   final uid = await _auth.getUID();

//   final doc = Firestore.instance
//       .collection("shoes")
//       .document(uid)
//       .collection("shoeCart")
//       .document(listShoe.documentID);
//   await doc.delete();
// }

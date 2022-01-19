import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/notifiers/ProductNotifier.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/cart_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    ProductNotifier listShoe = Provider.of<ProductNotifier>(context);
    total = listShoe.totalPrice;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.1,
        title: Container(
          child:
              Text('Cart', style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
              child: StreamBuilder(
                stream: getUserStreamSnap(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    double total = 0;
                    List<int> quan = [];
                    List<String> list = [];
                    snapshot.data.docs.forEach((element) {
                      list.add(element.get('price'));
                      quan.add(element.get('quantity'));
                    });
                    for (int i = 0; i < list.length; i++) {
                      total += (double.parse(
                              list[i].replaceAll(new RegExp(r'C\$'), ''))) *
                          quan[i];
                    }

                    return Text(
                      "Total: \$" "$total",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                  return Text("0.00");
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              width: 100,
              child: FlatButton(
                splashColor: Colors.white,
                onPressed: () {
                  clearCart();
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
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.data.size == 0) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Cart is Empty',
                  style: TextStyle(fontSize: 20, letterSpacing: 3),
                ),
              );
            }
            return Container(
              height: 500,
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisSpacing: 100,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) => CartCard(
                  snapshot.data.docs[index],
                  () {},
                  index,
                ),
              ),
            );
          }),
    );
  }

  Stream<QuerySnapshot> getUserStreamSnap() async* {
    AuthService _auth = new AuthService();
    final uid = await _auth.getUID();
    yield* FirebaseFirestore.instance
        .collection("shoes")
        .doc(uid)
        .collection("shoeCart")
        .snapshots();
  }

  Future clearCart() async {
    AuthService _auth = new AuthService();
    final uid = await _auth.getUID();
    final collection = await FirebaseFirestore.instance
        .collection("shoes")
        .doc(uid)
        .collection("shoeCart")
        .get();
    for (var doc in collection.docs) {
      await doc.reference.delete();
    }
  }
}

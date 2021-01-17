import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/products.dart';
import 'package:sample/notifiers/ProductNotifier.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/cart.dart';

class Details extends StatelessWidget {
  int newIndex;
  static const routeName = '/details';
  Details(this.newIndex);
  @override
  Widget build(BuildContext context) {
    ProductNotifier listShoe = Provider.of<ProductNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: (listShoe.items.isEmpty)
                  ? Icon(Icons.shopping_cart_outlined)
                  : Icon(Icons.shopping_cart)),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black,
                    indent: 50,
                    endIndent: 40,
                  ),
                  Container(
                    child: Text(products[newIndex].name),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 50,
                    endIndent: 40,
                  ),
                  Container(
                      height: 190,
                      color: Colors.white,
                      child: Image.network(products[newIndex].assetName)),
                  Container(
                    child: Text('Product Detail'),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: Divider(
                      endIndent: 240,
                    ),
                  ),
                  Container(
                    height: 110,
                    child: Text(
                      products[newIndex].descript,
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  //Size
                  //products[newIndex].sizes[newIndex]

                  Container(
                    height: 108,
                    padding: const EdgeInsets.only(top: 58),
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                        ),
                        BottomBar(newIndex: newIndex, listShoe: listShoe)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  BottomBar({
    Key key,
    @required this.newIndex,
    @required this.listShoe,
  }) : super(key: key);

  final int newIndex;
  AuthService _auth = new AuthService();
  final ProductNotifier listShoe;
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {
                print('tapped');
              },
              icon: Icon(Icons.favorite),
              color: Colors.white,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                products[newIndex].price,
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 70),
            child: IconButton(
              onPressed: () async {
                listShoe.add(products[newIndex]);
                final uid = await _auth.getUID();
                await db
                    .collection('shoes')
                    .document(uid)
                    .collection('shoeCart')
                    .add(products[newIndex].toJson());
              },
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

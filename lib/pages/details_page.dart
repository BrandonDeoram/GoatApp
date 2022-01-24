import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/products.dart';
import 'package:sample/notifiers/ProductNotifier.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/cart.dart';
import 'package:sizer/sizer.dart';

class Details extends StatefulWidget {
  int newIndex;
  static const routeName = '/details';
  bool cartEmpty = true;
  bool val = true;
  String uid;
  final List<Product> list;
  Details(this.list, this.newIndex);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
    lengthOfCart();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).viewPadding;
    double aph = MediaQuery.of(context).padding.top + kToolbarHeight;
    double height1 = deviceHeight - padding.top - padding.bottom - aph;

    double newh = WidgetsBinding.instance.window.physicalSize.height;
    ProductNotifier listShoe = Provider.of<ProductNotifier>(context);
    grabUID();

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("shoes")
                .doc(widget.uid)
                .collection("shoeCart")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                return IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    icon: Icon(Icons.shopping_cart_outlined));
              } else {
                return IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                    icon: Icon(Icons.shopping_cart));
              }
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 2, 2, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 40,
              ),
              Container(
                child: Text(widget.list[widget.newIndex].name),
              ),
              Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 40,
              ),
              Container(
                  height: deviceHeight * 0.28,
                  color: Colors.white,
                  child: Image.network(widget.list[widget.newIndex].assetName)),
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
                child: Text(
                  widget.list[widget.newIndex].descript,
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.31,
                  ),
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.only(top: 0),
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                        ),
                        BottomBar(newIndex: widget.newIndex, list: widget.list)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  grabUID() {
    getUID().then((String value) {
      setState(() {
        widget.uid = value;
      });
    });
  }
}

//TO:DO

Future<bool> lengthOfCart() async {
  AuthService _auth = new AuthService();
  final uid = await _auth.getUID();
  final snapshot = await FirebaseFirestore.instance
      .collection("shoes")
      .doc(uid)
      .collection("shoeCart")
      .get();
  if (snapshot.docs.length == 0) {
    print("cart is empty");

    return true;
  } else {
    print("cart is not empty");
    return false;
  }
}

Future<String> getUID() async {
  AuthService _auth = await new AuthService();
  final uid = await _auth.getUID();
  return Future.value(uid);
}

void getLengthCart() async {
  var value = await lengthOfCart();
  lengthOfCart().then((result) => value = result);
}

class BottomBar extends StatelessWidget {
  BottomBar({
    Key key,
    @required this.newIndex,
    @required this.list,
  }) : super(key: key);

  final int newIndex;
  AuthService _auth = new AuthService();
  final List<Product> list;
  final db = FirebaseFirestore.instance;

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
                list[newIndex].price,
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 70),
            child: IconButton(
              onPressed: () {
                addShoe(context, this.list, newIndex);
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

Future addShoe(context, List<Product> list, int newIndex) async {
  AuthService _auth = new AuthService();
  final uid = await _auth.getUID();
  print("UID" + uid.toString());
  final db = FirebaseFirestore.instance;
  String id = list[newIndex].id;
  final doc = FirebaseFirestore.instance
      .collection("shoes")
      .doc(uid)
      .collection("shoeCart")
      .doc(id);
  DocumentSnapshot getId = await FirebaseFirestore.instance
      .collection("shoes")
      .doc(uid)
      .collection("shoeCart")
      .doc(id)
      .get();

  if (getId.exists) {
    int quantity = getId['quantity'];
    quantity++;
    doc.update({'quantity': quantity});
    print('already in cart');
  } else {
    await db
        .collection('shoes')
        .doc(uid)
        .collection('shoeCart')
        .doc(id)
        .set(list[newIndex].toJson());
  }
}

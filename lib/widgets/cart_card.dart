import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class CartCard extends StatefulWidget {
  final Product product;
  final Function press;
  final List<Product> cart;
  final int index;
  const CartCard({Key key, this.product, this.press, this.cart, this.index})
      : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  void onDelete() {
    setState(() {
      widget.cart.removeAt(widget.index);
    });
  }

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
                      widget.product.price,
                      textScaleFactor: .8,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 140),
                    child: IconButton(
                      splashColor: Colors.blue,
                      onPressed: onDelete,
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
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(widget.product.name,
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
                  height: 300,
                  child: Image.network(
                    widget.product.assetName,
                    fit: BoxFit.contain,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

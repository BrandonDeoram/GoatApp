import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class NikeShoeCard extends StatelessWidget {
  final Product product;
  final Function press;
  final double height = 50;
  ShapeBorder shape;
  NikeShoeCard({Key key, this.product, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 1,
        color: Colors.transparent,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                product.price,
                textScaleFactor: .8,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Text(product.name, style: TextStyle(color: Colors.green)),
              alignment: Alignment.center,
            ),
            InkWell(
              child: Container(
                height: 300,
                child: Image.network(product.assetName),
              ),
              onTap: press,
            ),
          ],
        ),
      ),
    );
  }
}

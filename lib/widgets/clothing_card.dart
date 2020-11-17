import 'package:flutter/material.dart';
import 'package:sample/model/clothing.dart';

class ClothingCard extends StatelessWidget {
  @override
  final Clothing clothing;
  final Function press;
  final double height = 50;
  ShapeBorder shape;
  ClothingCard({Key key, this.clothing, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 0.2,
        color: Colors.white,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                height: 130,
                child: Image.network(clothing.assetName),
                alignment: Alignment.center,
              ),
              onTap: press,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                clothing.price,
                textScaleFactor: .8,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                clothing.name,
                style: TextStyle(color: Colors.black, fontSize: 10),
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}

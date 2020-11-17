import 'package:flutter/material.dart';

class Tees extends StatelessWidget {
  final String imagepath;
  final String imagename;
  final String price;
  final double height = 70;
  ShapeBorder shape;
  Tees(this.imagepath, this.imagename, this.price);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 0.2,
        color: Colors.grey,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            Container(
              child: Text(
                price,
                textScaleFactor: .8,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Text(imagename, style: TextStyle(color: Colors.black)),
              alignment: Alignment.bottomCenter,
            ),
            Ink.image(
              image: AssetImage(imagepath),
              child: InkWell(
                onTap: () {
                  print('Card was tapped');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample/pages/addidas.dart';
import 'package:sample/pages/jordans.dart';
import 'package:sample/pages/nike.dart';

class Categories extends StatelessWidget {
  final String imagepath;
  final String name;
  final double height = 70;
  final int index;
  ShapeBorder shape;
  Categories(this.imagepath, this.name, this.index);
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
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Text(name, style: TextStyle(color: Colors.black)),
              alignment: Alignment.bottomCenter,
            ),
            InkWell(
              child: Container(
                width: 150,
                child: Image.network(
                  imagepath,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Nike()));
                    break;
                  case 1:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addidas()));
                    break;
                  default:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Jordans()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

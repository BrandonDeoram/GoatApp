import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  final String assetname;
  LongCard(this.assetname);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 400,
      width: 400,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 8),
            child: Image(
              image: AssetImage(assetname),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                'Personal Favourite',
                style: TextStyle(color: Colors.black, fontSize:15,letterSpacing: 5),
              )),
        ],
      ),
    );
  }
}

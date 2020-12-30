import 'package:flutter/material.dart';

import 'package:sample/widgets/categories_shoe.dart';

import 'package:sample/model/categories_model.dart';

class Graphic extends StatelessWidget {
  Graphic();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('Brands'),
          padding: EdgeInsets.fromLTRB(0, 0, 280, 0),
        ),
        Container(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catShoes.length,
              itemBuilder: (_, index) {
                return Categories(
                    catShoes[index].name, catShoes[index].path, index);
              }),
        ),
      ],
    );
  }
}

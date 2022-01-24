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
          child: Text(
            'Brands',
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 340, 0),
        ),
        Container(
          padding: EdgeInsets.all(5),
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

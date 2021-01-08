import 'package:flutter/material.dart';
import 'package:sample/model/clothing.dart';
import 'package:sample/widgets/clothing_card.dart';

class ClothingPage extends StatelessWidget {
  ClothingPage();
  @override
  static const routeName = '/clothing-page';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Clothing',
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(3),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: clothings.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) =>
              ClothingCard(clothing: clothings[index], press: () {}),
        ),
      ),
    );
  }
}

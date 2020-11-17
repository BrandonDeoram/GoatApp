import 'package:flutter/material.dart';
import 'package:sample/main.dart';
import 'package:sample/model/clothing.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/Page1.dart';
import 'package:sample/pages/Page2.dart';
import 'package:sample/pages/clothing_page.dart';
import 'package:sample/widgets/cart.dart';
import 'package:sample/widgets/home.dart';
import 'package:sample/widgets/profile.dart';

class BottomItems extends StatelessWidget {
  final List<Clothing> clothingFav;
  final List<Product> favMeals;
  BottomItems(this.clothingFav,this.favMeals);
  @override
  static const routeName = '/bottomitems-page';
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Goat()));
              },
              tooltip: 'Home'),
          IconButton(
            icon: Icon(
              Icons.style,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClothingPage(this.clothingFav)));
            },
            tooltip: 'Clothing',
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart(favMeals)));
            },
            tooltip: 'Cart',
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}

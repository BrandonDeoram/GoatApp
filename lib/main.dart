import 'package:flutter/material.dart';
import 'package:sample/model/clothing.dart';
import 'package:sample/model/iconstemp.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/clothing_page.dart';
import 'package:sample/widgets/bottom_items.dart';
import 'pages/Page1.dart';
import 'pages/Page2.dart';

List<Product> favMeals = new List<Product>();
List<Clothing> clothingFav = new List<Clothing>();
void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Goat(),
        Discover.routeName: (ctx) => Discover(favMeals),
        BottomItems.routeName: (ctx) => BottomItems(clothingFav,favMeals),
        '/c': (BuildContext context) => null,
      },
    ));

class Goat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'MuseoModerno',
          primaryColor: Colors.white,
          accentColor: Colors.black,
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomItems(clothingFav,favMeals),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              elevation: 10,
              //backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (_) {},
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Discover',
                    ),
                  ),
                  Tab(
                    child: Text("Drops"),
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[Discover(favMeals), Drops()],
          ),
        ),
      ),
    );
  }
}

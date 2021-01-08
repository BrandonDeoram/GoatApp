import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample/model/clothing.dart';
import 'package:sample/model/iconstemp.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/clothing_page.dart';
import 'package:sample/pages/details_page.dart';
import 'package:sample/widgets/bottom_items.dart';
import 'notifiers/ProductNotifier.dart';
import 'pages/Page1.dart';
import 'pages/Page2.dart';
import 'package:provider/provider.dart';

List<Product> favMeals = new List<Product>();
List<Clothing> clothingFav = new List<Clothing>();
int index;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductNotifier()),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => Goat(),
            Discover.routeName: (ctx) => Discover(),
            BottomItems.routeName: (ctx) => BottomItems(),
            '/c': (BuildContext context) => null,
            Details.routeName: (ctx) => Details(index),
          },
        ));
  }
}

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
          bottomNavigationBar: BottomItems(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              elevation: 10,
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
            children: <Widget>[Discover(), Drops()],
          ),
        ),
      ),
    );
  }
}

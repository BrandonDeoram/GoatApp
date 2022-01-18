import 'package:flutter/material.dart';
import 'package:sample/pages/Page1.dart';
import 'package:sample/pages/Page2.dart';
import 'package:sample/widgets/bottom_items.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
          accentColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
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
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Drops",
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
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

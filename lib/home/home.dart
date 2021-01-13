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

import 'package:flutter/material.dart';
import './Page1.dart';

void main() => runApp(MaterialApp(
      home: Goat(),
    ));

class Goat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'MuseoModerno',
          primaryColor: Colors.white,
          accentColor: Colors.black,
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            children: <Widget>[Discover(), Text('bye bye')],
          ),
        ),
      ),
    );
  }
}

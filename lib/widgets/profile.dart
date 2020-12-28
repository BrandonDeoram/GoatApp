import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Container(
            alignment: Alignment.center,
            child: Text(
              'Profile',
              style: TextStyle(letterSpacing: 3),
            )),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/blank_pp.png'),
                        radius: 50,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Brandon Deoram',
                    style: TextStyle(letterSpacing: 3),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      Text(
                        'brandondeoram8931@gmail.com',
                        style: TextStyle(letterSpacing: 1, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Text(
                        '647-456-3453',
                        style: TextStyle(letterSpacing: 1, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.perm_identity),
                      Text(
                        '10099028',
                        style: TextStyle(letterSpacing: 1, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

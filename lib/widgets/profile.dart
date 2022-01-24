import 'package:flutter/material.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/services/database.dart';

class Profile extends StatefulWidget {
  Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  String email = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    _auth.getCurrentEmail().then((String val) {
      setState(() {
        this.email = val;
      });
    });

    DatabaseService().getName().then((value) {
      name = value;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 1,
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(letterSpacing: 3),
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'logout',
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
            onPressed: () async {
              await _auth.signOutAnon();
            },
          ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: this.name != ""
                      ? Text(
                          this.name,
                          style: TextStyle(letterSpacing: 3),
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 28,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey[200])),
                          child: TextField(
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              setState(() {
                                this.name = value;
                                DatabaseService().addName(name);
                              });
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "User Name"),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      Text(
                        this.email,
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

import 'package:flutter/material.dart';
import 'package:sample/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Center(
          child: Text(
            'DAPPER',
            style: TextStyle(letterSpacing: 5),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
                child: Text('Sign in anon'),
                onPressed: () async {
                  //returns user or error
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in\n' + result.uid);
                  }
                }),
          ),
        ],
      ),
    );
  }
}

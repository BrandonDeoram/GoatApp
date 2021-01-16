import 'package:flutter/material.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/shared/const.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //TextField states
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Center(
          child: Text(
            'DAPPER',
            style: TextStyle(letterSpacing: 5, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              height: 250,
              width: 300,
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //email
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                       decoration: textInputDec.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter email' : null,
                      //Onchanged essentially each time a user enters a space or extra letter it enters that val
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    //Password
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      //password doesnt show
                       decoration: textInputDec.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) =>
                          val.length < 6 ? 'Enter password 6+ char long' : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(top: 0),
                      elevation: 1,
                      color: Colors.white,
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.signInWEP(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'supply valid email';
                            });
                          }
                        }
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// child: RaisedButton(
//     child: Text('Sign in anon'),
//     onPressed: () async {
//       //returns user or error
//       dynamic result = await _auth.signInAnon();
//       if (result == null) {
//         print('error signing in');
//       } else {
//         print('signed in\n' + result.uid);
//       }
//     }),

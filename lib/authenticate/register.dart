import 'package:flutter/material.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/shared/const.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
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
              margin: EdgeInsets.fromLTRB(30, 13, 0, 0),
              height: 250,
              width: 300,
              color: Colors.white,
              child: Form(
                //keeping track of the state of the form so we can validate
                key: _formKey,
                child: Column(
                  children: [
                    //email
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      autofocus: false,
                      //Onchanged essentially each time a user enters a space or extra letter it enters that val
                      decoration: textInputDec.copyWith(hintText: 'Email'),

                      validator: (val) => val.isEmpty ? 'Enter email' : null,
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
                      autofocus: false,
                       decoration: textInputDec.copyWith(hintText: 'Password'),
                      //password doesnt show
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          padding: EdgeInsets.only(top: 0),
                          elevation: 1,
                          color: Colors.white,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              //getting null if error  or user
                              dynamic result =
                                  await _auth.registerWEP(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'supply valid email';
                                });
                              }
                            }
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: RaisedButton(
                            elevation: 1,
                            color: Colors.white,
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              widget.toggleView();
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user obj based on FirebaseUser
  User _userFBU(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    //turning it into our own stream of users instead of firebase user
    //Anytime user sign in or sign out itll let us know
    //(FirebaseUser user) => _userFBU(user) same thing as bellow
    return _auth.onAuthStateChanged.map(_userFBU);
  }

  //sign in anon
  Future signInAnon() async {
    //Interacting with firebase auth to log in anon
    try {
      //making a request using await
      //Returns a authresult
      AuthResult result = await _auth.signInAnonymously();
      //After it returns we have access to the user object
      FirebaseUser user = result.user;

      return _userFBU(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //regist with email & password

  //sign out
  Future signOutAnon() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

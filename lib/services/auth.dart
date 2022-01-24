import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/model/user.dart';
import 'package:sample/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user obj based on User
  UserUID _userFBU(User user) {
    return user != null ? UserUID(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserUID> get user {
    //turning it into our own stream of users instead of firebase user
    //Anytime user sign in or sign out itll let us know
    //(User user) => _userFBU(user) same thing as bellow
    return _auth.authStateChanges().map(_userFBU);
  }

  //Getting uid val
  Future<String> getUID() async {
    return (await _auth.currentUser).uid;
  }

  //sign in anon
  Future signInAnon() async {
    //Interacting with firebase auth to log in anon
    try {
      //making a request using await
      //Returns a UserCredential
      UserCredential result = await _auth.signInAnonymously();
      //After it returns we have access to the user object
      User user = result.user;

      return _userFBU(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWEP(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFBU(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWEP(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //Create a new doc for the user with that uid
      await DatabaseService(uid: user.uid)
          .updateUserData('', '', '', '', '', null, 0);
      return _userFBU(user);
    } catch (e) {
      //not succesful
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOutAnon() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> getCurrentEmail() async {
    User user = _auth.currentUser;
    if (user != null) {
      return await user.email;
    }
    return await "";
  }
}

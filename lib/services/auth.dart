import 'package:firebase_auth/firebase_auth.dart' as firebase;
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:triease_app/models/UserModel.dart';

class AuthServices {
  //sign in instance
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;

  //create a user from firebase user with uid
  Usermodel? _userWithFirebaseUserUid(firebase.User? user) {
    return user != null ? Usermodel(uid: user.uid) : null;
  }

  //create the stream for checking the auth changes in the user
  // ignore: non_constant_identifier_names
  Stream<Usermodel?> get User {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  //sign in anonymos
  Future signInAnonymously() async {
    try {
      firebase.UserCredential result = await _auth.signInAnonymously();
      firebase.User? user = result.user;
      return user;
    } catch (err) {
      return null;
    }
  }

  //register using email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {} catch (err) {
      firebase.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebase.User? user = result.user;

      return _userWithFirebaseUserUid(user);
    }
    try {} catch (err) {
      return null;
    }
  }

  //signin using email and password

  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      firebase.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebase.User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in using gmail

  //signout
  Future signOut() async {
    return await _auth.signOut();
    try {} catch (err) {
      print(err.toString());
      return null;
    }
  }
}

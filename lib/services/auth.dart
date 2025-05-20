import 'package:firebase_auth/firebase_auth.dart';
import 'package:triease_app/models/UserModel.dart';

class AuthServices {
  //sign in instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from firebase user with uid
  Usermodel? _userWithFirebaseUserUid(User? user) {
    return user != null ? Usermodel(uid: user.uid) : null;
  }

  //create the stream for checking the auth changes in the user
  Stream<Usermodel?> get User {
    _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  //sign in anonymos
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //register using email and password
  Future registerWithEmailAndPassword(String email, String Password) async {
    try {} catch (err) {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      return _userWithFirebaseUserUid(user);
    }
    try {} catch (err) {
      print(err.toString());
      return null;
    }
  }

  //signin using email and password

  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instant_messenger_app/models/users.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Condition ? True : False
  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(userId: user.uid) : null;
  }

  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      // AuthResult result = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // FirebaseUser firebaseUser = result.user;

      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;

      return _userFromFirebaseUser(firebaseUser);
      
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpwithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser = result.user;

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}


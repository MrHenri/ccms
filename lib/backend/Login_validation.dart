import 'package:ccms/backend/services/auth_user.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:ccms/backend/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Login extends BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> signIn(User user) async {
    try {
      AuthResult auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: user.email.trim(), password: user.password);
      final FirebaseUser fireUser = auth.user;
      return fireUser.isEmailVerified ? fireUser : null;
    }catch (e) {
      print(e);
      return null;
    }
//    return fireUser.isEmailVerified ? fireUser : null;
  }

  @override
  Future<void> signOut() {
    FirebaseAuth.instance.signOut().then((value) {}).catchError((e) {print(e);});
  }

  @override
  Future<FirebaseUser> signUp(User user) async {
    try {
      AuthResult auth = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email.trim(), password: user.password);

      final FirebaseUser fireUser = auth.user;

      await UserManagement(uid: fireUser.uid).storeNewUser(user);
      await fireUser.sendEmailVerification();
      return fireUser;
    } catch (e) {
      print("An error occured while trying to send email        verification");
      print(e.message);
      return null;
    }
  }
}

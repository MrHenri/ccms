import 'dart:async';
import 'package:ccms/backend/models/user.dart';
import 'package:ccms/backend/services/user_management.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<FirebaseUser> signIn(String email, String password);
  Future<FirebaseUser> signUp(User user);
  void signOut();
}
class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> signUp(User user) async{
    try {
      AuthResult auth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email.trim(), password: user.password);

      final FirebaseUser fireUser = auth.user;

      await UserManagement(uid: fireUser.uid)
          .storeNewUser(user); // Armazena os dados do usuário do store
      await fireUser.sendEmailVerification();
      return fireUser;
    } catch (e) {
      print("An error occured while trying to send email        verification");
      print(e.message);
      return null;
    }
  }

  @override
  Future<FirebaseUser> signIn(String email, String password) async{
    try {
      AuthResult auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return auth.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void signOut() {
    FirebaseAuth.instance.signOut().then((value) {}).catchError((e) {
      print(e);
    });
  }

}
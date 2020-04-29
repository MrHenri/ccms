import 'dart:async';

import 'package:ccms/backend/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<FirebaseUser> signIn(User user);
  Future<FirebaseUser> signUp(User user);
  Future<void> signOut();
}
class Auth implements BaseAuth {

  @override
  Future<FirebaseUser> signUp(User user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> signIn(User user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
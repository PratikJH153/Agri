import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthContracts {
  Future<bool> googleSignIn();
  bool isUserGoogleSignedIn();
  User getUser();
  String getUserID();
  Future<bool> googleSignOut();
}

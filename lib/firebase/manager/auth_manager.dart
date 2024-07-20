import 'dart:convert';
import 'dart:math';

import 'package:agri/firebase/contracts/auth_contracts.dart';
import 'package:agri/helper/handleException.dart';
import 'package:agri/services/debug_data.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager implements AuthContracts {
  final String filename = "auth_manager.dart";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  User getUser() {
    try {
      return _auth.currentUser!;
    } catch (err, stacktrace) {
      handleException(err, stacktrace, filename);
      rethrow;
    }
  }

  @override
  String getUserID() {
    try {
      return _auth.currentUser?.uid ?? "o0IXRqOF4PXqpGj3VwgzG5A7hkf1";
    } catch (err, stacktrace) {
      handleException(err, stacktrace, filename);
      rethrow;
    }
  }

  @override
  Future<bool> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential authResult = await _auth.signInWithCredential(credential);
      final User user = authResult.user!;

      debugData(
        "User Name: ${user.displayName} Email: ${user.email}",
        filename: filename,
      );

      assert(!user.isAnonymous);
      User currentUser = _auth.currentUser!;
      assert(user.uid == currentUser.uid);

      return true;
    } catch (err, stacktrace) {
      handleException(err, stacktrace, filename);
    }

    return false;
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<bool> googleSignOut() async {
    try {
      _googleSignIn.signOut();
      _googleSignIn.disconnect();
      _auth.signOut();

      return true;
    } catch (err, stacktrace) {
      handleException(err, stacktrace, filename);
    }

    return false;
  }

  @override
  bool isUserGoogleSignedIn() {
    try {
      if (_auth.currentUser != null) {
        return true;
      } else {
        return false;
      }
    } catch (err, stacktrace) {
      handleException(err, stacktrace, filename);
    }

    return false;
  }
}

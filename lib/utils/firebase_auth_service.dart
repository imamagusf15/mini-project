// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/model/user_model.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  String? errorCode;

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      uid: user.uid,
      email: user.email!,
      name: user.displayName!,
    );
  }

  Stream<UserModel?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email atau Password salah!"),
      ));
    }

    return _userFromFirebase(user);
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return _userFromFirebase(user);
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {}

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<User?> refreshUser(User user) async {
    await user.reload();
    User? refreshedUser = _firebaseAuth.currentUser;

    return refreshedUser;
  }
}

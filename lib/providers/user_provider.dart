import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Future<String> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return 'Invalid email or password';
        case 'invalid-email':
          return 'Invalid email or password';
        default:
          return 'This user has been disabled';
      }
    } on SocketException {
      return 'Network problem try again later';
    }
  }

  Future<String> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email is already in use';
        case 'invalid-email':
          return 'Invalid email address';
        default:
          return 'You entered a weak password';
      }
    } on SocketException {
      return 'Network problem try again later';
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      return 'Check your internect connecting and that your email is valid';
    }
  }
}
Future<bool> completeProfile(score) async{
  final userId = FirebaseAuth.instance.currentUser.uid;
  final email = FirebaseAuth.instance.currentUser.email;
  await FirebaseFirestore.instance.collection('users').doc(userId).set(score);
}
class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData(int score, String uid) async {
    return await profileList
        .doc(uid)
        .set({'score': score});
  }
}
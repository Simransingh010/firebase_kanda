import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_kanda/models/user_model.dart';
import 'package:flutter/material.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('users').add(user.toJson());
      debugPrint('User added to Firestore');
    } catch (e) {
      debugPrint('Error adding user to Firestore: $e');
    }
  }
}

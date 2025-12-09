import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepoImpl implements UserRepository {
  // This is kept private so that no other class can access this firebase_auth
  final FirebaseAuth _firebaseAuth;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepoImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setUserData({required MyUser myUser}) async {
    try {
      await usersCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      // rethrow now and later catch in bloc
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp({
    required MyUser myUser,
    required String password,
  }) async {
    try {
      final UserCredential user = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: myUser.email,
            password: password,
          );

      // we took MyUser as parameter cause we wanted to use copywith method
      return myUser.copyWith(userId: user.user!.uid);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  // authStateChanges is triggered every time user signin or signout
  Stream<User?> get user =>
      _firebaseAuth.authStateChanges().map((firebaseUser) => firebaseUser);
  // this is redundant code why map?
}

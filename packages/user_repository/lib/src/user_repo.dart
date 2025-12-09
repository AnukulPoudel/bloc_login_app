// abstract class cannot be instantiated only extended/implemented
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';


abstract class UserRepository {
  // getUser
  Stream<User?> get user;

  // signUp
  Future<MyUser> signUp({required MyUser myUser, required String password});

  // setUserData
  Future<void> setUserData({required MyUser myUser});

  // signIn
  Future<void> signIn({required String email, required String password});
}

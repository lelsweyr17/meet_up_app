import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:meet_up_app/core/error/exceptions.dart';
import 'package:meet_up_app/core/utils/log.dart';

import '../../domain/entity/user.dart';

const _tag = "authorization_remote_datasource";

abstract class AuthorizationRemoteDatasource {
  Future<User> login({
    required String login,
    required String password,
  });

  Future<User> signUp({
    required String login,
    required String password,
  });
}

class AuthorizationRemoteDatasourceImpl
    implements AuthorizationRemoteDatasource {
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthorizationRemoteDatasourceImpl({
    required auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  @override
  Future<User> login({
    required String login,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: login,
        password: password,
      );
      final firebaseUser = result.user!;

      return User(uid: firebaseUser.uid, email: login);
    } on auth.FirebaseAuthException catch (e) {
      Log.message(_tag, e.message.toString());
      throw ServerException(e.message.toString());
    }
  }

  @override
  Future<User> signUp({
    required String login,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: login,
        password: password,
      );
      final firebaseUser = result.user!;

      _createNewUserInFirebase(firebaseUser);

      return User(uid: firebaseUser.uid, email: login);
    } on auth.FirebaseAuthException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

  void _createNewUserInFirebase(auth.User user) {
    _firestore.collection('users').doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
    });
  }
}

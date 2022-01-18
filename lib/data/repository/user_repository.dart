import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "user_repository";

class UserRepository {
  const UserRepository._create();

  static const UserRepository _instance = UserRepository._create();

  static UserRepository get instance => _instance;

  static final _userDoc = Completer<DocumentReference>();

  static void init() {
    Log.message(_tag, "init");
    FirebaseAuth.instance.userChanges().listen((user) {
      Log.message(_tag, "user $user");
    });
  }
}

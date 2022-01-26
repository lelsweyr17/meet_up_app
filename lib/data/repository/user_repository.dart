import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meet_up_app/data/model/client/user.dart' as client;
import 'package:meet_up_app/data/model/serializers.dart';
import 'package:meet_up_app/utils/log.dart';
import 'package:rxdart/rxdart.dart';

const _tag = "user_repository";

class UserRepository {
  UserRepository._create();

  static final UserRepository _instance = UserRepository._create();

  static UserRepository get instance => _instance;

  final _firebaseCollection = FirebaseFirestore.instance.collection("users");

  final _userSubject = BehaviorSubject<client.User>();
  bool _initedFetch = false;

  Stream get _firebaseStream => _firebasePath.snapshots();

  Stream<client.User> get stream {
    Log.message(_tag, "stream");
    if (!_initedFetch) {
      _initedFetch = true;
      _init();
    }

    return _userSubject;
  }

  client.User get data {
    Log.message(_tag, "stream");
    if (!_initedFetch) {
      _initedFetch = true;
      _init();
    }

    return _userSubject.value;
  }

  DocumentReference get _firebasePath =>
      _firebaseCollection.doc(currentUser.uid);

  User get currentUser => FirebaseAuth.instance.currentUser!;

  Future<void> _init() async {
    Log.message(_tag, "_init");

    try {
      await _fetchUser();
    } catch (e) {
      Log.message(_tag, e.toString());
    }
  }

  Future<void> _fetchUser() async {
    Log.message(_tag, "_fetchUser");

    final client.User? user = await _firebaseStream
        .firstWhere((user) => user != null)
        .then((snapshot) => deserialize<client.User>(snapshot.data() as Map));

    Log.message(_tag, "fetched user -> $user");

    _userSubject.add(user!);
  }

  void dispose() {
    _userSubject.close();
  }

  void setUsername(String name) {
    Log.message(_tag, "setUsername: $name");
    _updateUser((user) => user.name = name);
  }

  void setBio(String value) {
    Log.message(_tag, "setBio: $value");
    _updateUser((user) => user.bio = value);
  }

  void _updateUser(Function(client.UserBuilder) updates) async {
    Log.message(_tag, "_updateUser");

    final updatedUser = _userSubject.value.rebuild(updates);

    _userSubject.add(updatedUser);

    _firebasePath.update(serialize(updatedUser) as Map<String, Object>);
  }
}

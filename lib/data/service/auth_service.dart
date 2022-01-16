import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "auth_service";

class AuthService {
  AuthService._create() {
    _init();
  }

  static final AuthService _instance = AuthService._create();

  static AuthService get instance => _instance;

  Future<void> _init() async {
    Log.message(_tag, "_init");

    if (FirebaseAuth.instance.currentUser == null) {
      UserCredential userCredential = await signInAnonymously();
      Log.message(_tag, "signInAnonymously: userCredential=$userCredential");
    }

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Log.message(_tag, 'User is currently signed out!');
      } else {
        Log.message(
            _tag, "currentUser: id=${FirebaseAuth.instance.currentUser?.uid}");
        Log.message(_tag, 'User is signed in!');
      }
    });
  }

  Future<UserCredential> signInAnonymously() async {
    Log.message(_tag, "signInAnonymously");

    return await FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "createUserWithEmailAndPassword: email=$email");

    if (FirebaseAuth.instance.currentUser?.isAnonymous == true) {
      await _createUserWhenCurrentUserIsAnonymous(
        email: email,
        password: password,
      );
    } else if (FirebaseAuth.instance.currentUser == null) {
      await _createUserWhenCurrentUserIsNull(
        email: email,
        password: password,
      );
    }
  }

  Future<void> _createUserWhenCurrentUserIsAnonymous({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "_createUserWhenCurrentUserIsAnonymous: email=$email");

    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await _linkWithAnonymous(credential);

    _createFirestoreUser();
  }

  Future<void> _createFirestoreUser() async {
    Log.message(_tag, "_createFirestoreUser");
    final currentUser = FirebaseAuth.instance.currentUser!;
    final users = FirebaseFirestore.instance.collection('users');

    await users.doc(currentUser.uid).set({
      'id': currentUser.uid,
    });
  }

  Future<void> _createUserWhenCurrentUserIsNull({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "_createUserWhenUserIsNull: email=$email");

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _createFirestoreUser();
  }

  Future<void> _linkWithAnonymous(AuthCredential credential) async {
    Log.message(_tag, "_linkWithAnonymous: credential=$credential");

    await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "signInWithEmailAndPassword: email=$email");

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    Log.message(_tag, "signOut");

    await FirebaseAuth.instance.signOut();
  }

  bool get isUserAnonymousOrNull {
    return FirebaseAuth.instance.currentUser == null ||
        FirebaseAuth.instance.currentUser!.isAnonymous;
  }
}

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
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser == null) {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      Log.message(_tag, "signInAnonymously: userCredential=$userCredential");
    }
    Log.message(_tag, "instance: $instance");
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     Log.message(_tag, 'User is currently signed out!');
    //   } else {
    //     Log.message(_tag, 'User is signed in!');
    //   }
    // });
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(_tag,
        "createUserWithEmailAndPassword: email=$email, password=$password");
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(
        _tag, "signInWithEmailAndPassword: email=$email, password=$password");
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

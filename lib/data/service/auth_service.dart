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
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
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

  Future<bool> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "createUserWithEmailAndPassword: email=$email");
    try {
      if (FirebaseAuth.instance.currentUser?.isAnonymous == true) {
        Log.message(_tag, "current user is anonymous");
        final credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );

        final result = await _linkWithAnonymous(credential);

        if (result) {
          Log.message(_tag,
              "current credentials: ${FirebaseAuth.instance.currentUser}");
        }
      }

      if (FirebaseAuth.instance.currentUser == null) {
        Log.message(_tag, "current user == null");
        final credential = FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Log.message(_tag, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Log.message(_tag, 'The account already exists for that email.');
      } else {
        Log.message(_tag, e.toString());
      }
    } catch (e) {
      Log.message(_tag, e.toString());
    }
    return false;
  }

  Future<bool> _linkWithAnonymous(AuthCredential credential) async {
    Log.message(_tag, "_linkWithAnonymous: credential=$credential");
    try {
      final userCredential = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential);

      Log.message(_tag, "Link with anonymous is success");

      return true;
    } catch (e) {
      Log.message(_tag, "Link with anonymous is failure");
      Log.message(_tag, e.toString());

      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Log.message(_tag, "signInWithEmailAndPassword: email=$email");
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("signInWithEmailAndPassword ${userCredential}");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.message(_tag, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Log.message(_tag, 'Wrong password provided for that user.');
      } else if (e.code == "invalid-email") {
        Log.message(_tag, 'The email address is badly formatted.');
      } else {
        Log.message(_tag, e.code.toString());
      }
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool get isUserAnonymous {
    return FirebaseAuth.instance.currentUser != null &&
        !FirebaseAuth.instance.currentUser!.isAnonymous;
  }
}

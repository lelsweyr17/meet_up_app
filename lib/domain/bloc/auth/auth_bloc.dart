import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/services/preferences_service.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "auth_bloc";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    _init();
  }

  void _init() {
    Log.message(_tag, "_init");
    _handleEvents();

    _emailStream.listen((email) => _email = email);
    _passwordStream.listen((password) => _password = password);
  }

  final _authService = AuthService.instance;
  String _password = "";
  String _email = "";

  final _passwordController = StreamController<String>();
  final _emailController = StreamController<String>();

  Sink<String> get passwordSink => _passwordController.sink;

  Sink<String> get emailSink => _emailController.sink;

  Stream<String> get _passwordStream => _passwordController.stream;

  Stream<String> get _emailStream => _emailController.stream;

  void _handleEvents() {
    Log.message(_tag, "_handleEvents");

    on<LogInEvent>((_, emit) async => await _logInEvent(emit));
    on<LogOutEvent>((_, emit) async => await _logOutEvent(emit));
    on<SignUpEvent>((_, emit) async => await _signUpEvent(emit));
  }

  Future<void> _logInEvent(Emitter emit) async {
    Log.message(_tag, "_logInEvent");

    try {
      await _logIn(emit);
    } on Exception catch (e) {
      _logInFailed(e, emit);
    }
  }

  Future<void> _logIn(Emitter emit) async {
    _emitLoadingAuthentication(emit);
    await _signInWithEmailAndPassword();
    PreferencesService.instance.setShowStartPage(false);
    _emitAuthenticated(emit);
  }

  void _logInFailed(Exception e, Emitter emit) {
    Log.message(_tag, e.toString());
    _emitUnauthenticated(emit);
  }

  Future<void> _logOutEvent(Emitter emit) async {
    Log.message(_tag, "_logOutEvent");

    try {
      await _logOut(emit);
    } on Exception catch (e) {
      _logOutFailed(e, emit);
    }
  }

  Future<void> _logOut(Emitter emit) async {
    _emitLoadingAuthentication(emit);
    await _authService.signOut();
    _emitUnauthenticated(emit);
  }

  void _logOutFailed(Exception e, Emitter emit) {
    Log.message(_tag, e.toString());
    _emitAuthenticated(emit);
  }

  Future<void> _signUpEvent(Emitter emit) async {
    Log.message(_tag, "_signUpEvent");
    try {
      _signUp(emit);
    } on Exception catch (e) {
      _signUpFailed(e, emit);
    }
  }

  Future<void> _signUp(Emitter emit) async {
    _emitLoadingAuthentication(emit);
    await _createUserWithEmailAndPassword();
    _emitAuthenticated(emit);
  }

  Future<void> _createUserWithEmailAndPassword() async {
    await _authService.createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    await _authService.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    );
  }

  void _signUpFailed(Exception e, Emitter emit) {
    Log.message(_tag, e.toString());
    _emitUnauthenticated(emit);
  }

  void _emitLoadingAuthentication(Emitter emit) {
    emit(LoadingAuthentication());
  }

  void _emitAuthenticated(Emitter emit) {
    emit(Authenticated());
  }

  void _emitUnauthenticated(Emitter emit) {
    emit(Unauthenticated());
  }

  void dispose() {
    _passwordController.close();
    _emailController.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/services/preferences_service.dart';
import 'package:meet_up_app/utils/log.dart';
import 'package:meet_up_app/utils/result.dart';

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

    on<LogInEvent>(
      (event, emit) async => await _logInEvent(emit),
    );
    on<LogOutEvent>(
      (event, emit) async => await _logOutEvent(emit),
    );
    on<SignUpEvent>(
      (event, emit) async => await _signUpEvent(emit),
    );
  }

  Future<void> _logInEvent(Emitter emit) async {
    Log.message(_tag, "_logInEvent");
    emit(LoadingAuthentication());

    final result = await _authService.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    );

    if (result == Result.success) {
      PreferencesService.instance.setShowStartPage(false);
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _logOutEvent(Emitter emit) async {
    Log.message(_tag, "_logOutEvent");
    emit(LoadingAuthentication());

    final result = await _authService.signOut();

    if (result == Result.success) {
      emit(Unauthenticated());
    } else {
      emit(Authenticated());
    }
  }

  Future<void> _signUpEvent(Emitter emit) async {
    Log.message(_tag, "_signUpEvent");
    emit(LoadingAuthentication());

    final result = await _authService.createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    );

    if (result == Result.success) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  void dispose() {
    _passwordController.close();
    _emailController.close();
  }
}

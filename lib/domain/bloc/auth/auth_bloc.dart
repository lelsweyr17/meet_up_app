import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meet_up_app/data/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.unauthenticated) {
    _outEvent.listen((event) => _handleEvent(event));
    _emailStream.listen((email) => _email = email);
    _passwordStream.listen((password) => _password = password);
  }

  final _authService = AuthService.instance;
  String _password = "";
  String _email = "";

  final _eventController = StreamController<AuthEvent>();
  final _passwordController = StreamController<String>();
  final _emailController = StreamController<String>();

  Sink<AuthEvent> get inEvent => _eventController.sink;

  Sink<String> get passwordSink => _passwordController.sink;

  Sink<String> get emailSink => _emailController.sink;

  Stream<AuthEvent> get _outEvent => _eventController.stream;

  Stream<String> get _passwordStream => _passwordController.stream;

  Stream<String> get _emailStream => _emailController.stream;

  void _handleEvent(AuthEvent event) {
    if (event == AuthEvent.logIn) {
      _authService.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } else if (event == AuthEvent.logOut) {
      _authService.signOut();
    } else if (event == AuthEvent.signUp) {
      _authService.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    }
  }

  void dispose() {
    _eventController.close();
  }
}

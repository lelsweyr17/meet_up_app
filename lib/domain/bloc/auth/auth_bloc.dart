import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "auth_bloc";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    _init();
  }

  void _init() {
    Log.message(_tag, "_init");
    on<AuthEvent>(
      (event, emit) {
        _handleEvent(event, emit);
      },
    );

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

  Future<void> _handleEvent(
    AuthEvent event,
    Emitter emit,
  ) async {
    if (event is LogInEvent) {
      final result = await _authService.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } else if (event is LogOutEvent) {
      _authService.signOut();
    } else if (event is SignUpEvent) {
      _authService.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    }

    void dispose() {
      _eventController.close();
    }
  }
}

part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {}

class LogInEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

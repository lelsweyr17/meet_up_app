part of 'auth_bloc.dart';

abstract class AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class LoadingAuthentication extends AuthState {}

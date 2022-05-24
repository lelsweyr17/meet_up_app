import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meet_up_app/core/error/failures.dart';
import 'package:meet_up_app/core/use_cases/authorization_use_cases.dart';

import '../entity/user.dart';
import '../repository/authorization_repository.dart';

class LoginUseCase implements AuthorizationUseCases<User, Params> {
  final AuthorizationRepository _repository;

  LoginUseCase({
    required AuthorizationRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await _repository.login(
      login: params.login,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String login;
  final String password;

  const Params({
    required this.login,
    required this.password,
  });

  @override
  List<Object?> get props => [login, password];
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/authorization_use_cases.dart';
import '../entity/user.dart';
import '../repository/authorization_repository.dart';
import 'login_use_case.dart';

class SignUpUseCase implements AuthorizationUseCases<User, Params> {
  final AuthorizationRepository _repository;

  SignUpUseCase({
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

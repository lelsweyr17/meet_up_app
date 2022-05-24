import 'package:dartz/dartz.dart';
import 'package:meet_up_app/core/error/failures.dart';

import '../entity/user.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, User>> login({
    required String login,
    required String password,
  });

  Future<Either<Failure, User>> signUp({
    required String login,
    required String password,
  });
}

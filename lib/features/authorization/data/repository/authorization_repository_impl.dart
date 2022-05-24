import 'package:dartz/dartz.dart';
import 'package:meet_up_app/core/error/exceptions.dart';
import 'package:meet_up_app/core/error/failures.dart';
import 'package:meet_up_app/core/network/network_info.dart';
import 'package:meet_up_app/features/authorization/data/datasources/authorization_local_datasource.dart';
import 'package:meet_up_app/features/authorization/data/datasources/authorization_remote_datasource.dart';

import '../../domain/entity/user.dart';
import '../../domain/repository/authorization_repository.dart';

typedef _LoginOrSignUpChooser = Future<User> Function();

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationRemoteDatasource remoteDatasource;
  final AuthorizationLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  AuthorizationRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login({
    required String login,
    required String password,
  }) async {
    return await _getUser(
      () => remoteDatasource.login(
        login: login,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String login,
    required String password,
  }) async {
    return await _getUser(
      () => remoteDatasource.signUp(
        login: login,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    _LoginOrSignUpChooser loginOrSignUp,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await loginOrSignUp();
        localDatasource.cacheLastLogin(remoteUser.email);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

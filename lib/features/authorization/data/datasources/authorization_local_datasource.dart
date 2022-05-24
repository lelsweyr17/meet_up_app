import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthorizationLocalDatasource {
  Future<CachedLoginParam> getLastLogin();

  Future<void> cacheLastLogin(String login);
}

const CACHED_LAST_LOGIN = 'CACHED_LAST_LOGIN';

class AuthorizationLocalDatasourceImpl implements AuthorizationLocalDatasource {
  final SharedPreferences _sharedPreferences;

  AuthorizationLocalDatasourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<CachedLoginParam> getLastLogin() async {
    final login = _sharedPreferences.getString(CACHED_LAST_LOGIN);
    return CachedLoginParam(login);
  }

  @override
  Future<void> cacheLastLogin(String login) async {
    _sharedPreferences.setString(CACHED_LAST_LOGIN, login);
  }
}

class CachedLoginParam extends Equatable {
  final String? login;

  const CachedLoginParam(this.login);

  @override
  List<Object?> get props => [login];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meet_up_app/core/network/network_info.dart';
import 'package:meet_up_app/core/utils/log.dart';
import 'package:meet_up_app/features/authorization/data/repository/authorization_repository_impl.dart';
import 'package:meet_up_app/features/authorization/domain/repository/authorization_repository.dart';
import 'package:meet_up_app/features/authorization/domain/use_cases/login_use_case.dart';
import 'package:meet_up_app/features/authorization/domain/use_cases/sign_up_use_case.dart';
import 'package:meet_up_app/features/authorization/presentation/logic/authorization_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authorization/data/datasources/authorization_local_datasource.dart';
import 'features/authorization/data/datasources/authorization_remote_datasource.dart';

const _tag = "injection_container";

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features

  /* Authorization */
  await _injectAuthorizationFeature();

  Log.message(_tag, "init finished");
}

Future<void> _injectAuthorizationFeature() async {
  // MobX
  getIt.registerFactory<AuthorizationLogic>(
    () => AuthorizationLogic(
      loginUseCase: getIt(),
      signUpUseCase: getIt(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: getIt()));
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<AuthorizationRepository>(
    () => AuthorizationRepositoryImpl(
      remoteDatasource: getIt(),
      localDatasource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<AuthorizationRemoteDatasource>(
    () => AuthorizationRemoteDatasourceImpl(
      firebaseAuth: getIt(),
      firestore: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthorizationLocalDatasource>(
    () => AuthorizationLocalDatasourceImpl(sharedPreferences: getIt()),
  );

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  final firebaseAuth = FirebaseAuth.instance;
  getIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);

  final firebaseFirestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
  //
  // getIt.registerLazySingleton<DataConnectionChecker>(
  //     () => DataConnectionChecker());
}

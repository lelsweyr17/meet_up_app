import 'package:meet_up_app/data/repository/user_repository.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/profile/profile_bloc.dart';
import 'package:provider/provider.dart';

const _tag = "providers";

class Providers {
  const Providers._create();

  static const Providers _instance = Providers._create();

  static Providers get instance => _instance;

  List<Provider> get providers => [
        Provider<AuthBloc>(
          create: (_) => AuthBloc(),
          dispose: (_, it) => it.dispose(),
        ),
        Provider<UserRepository>(
          create: (_) => UserRepository.instance,
          dispose: (_, it) => UserRepository.instance.dispose(),
        ),
        Provider<ProfileBloc>(
          create: (_) => ProfileBloc(),
        ),
      ];
}

import 'package:bloc/bloc.dart';
import 'package:meet_up_app/data/repository/user_repository.dart';
import 'package:meet_up_app/utils/log.dart';

part 'profile_event.dart';

part 'profile_state.dart';

const _tag = "profile_bloc";

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    _init();
  }

  void _init() {
    Log.message(_tag, "_init");
    _handleEvents();
  }

  void _handleEvents() {
    Log.message(_tag, "_handleEvents");

    on<UpdateName>((event, _) => _updateName(event.name));
    on<UpdateBio>((event, _) => _updateBio(event.bio));
  }

  void _updateName(String name) {
    UserRepository.instance.setUsername(name);
  }

  void _updateBio(String bio) {
    UserRepository.instance.setBio(bio);
  }
}

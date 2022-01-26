part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateName extends ProfileEvent {
  const UpdateName(this.name);

  final String name;
}

class UpdateBio extends ProfileEvent {
  const UpdateBio(this.bio);

  final String bio;
}

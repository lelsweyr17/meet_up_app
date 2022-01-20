import 'package:meet_up_app/data/repository/user_repository.dart';

class ProfileService {
  const ProfileService._create();

  static const ProfileService _instance = ProfileService._create();

  static ProfileService get instance => _instance;

  void setUsername(String name) {
    UserRepository.instance.setUsername(name);
  }

  void setBio(String value) {
    UserRepository.instance.setBio(value);
  }
}

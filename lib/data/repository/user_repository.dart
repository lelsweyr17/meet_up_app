import 'package:meet_up_app/data/model/client/user.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "user_repository";

class UserRepository {
  UserRepository._create();

  static final UserRepository _instance = UserRepository._create();

  static UserRepository get instance => _instance;

  void setUsername(String name) {
    Log.message(_tag, "setUsername: $name");
    _updateUser((user) => user.name = name);
  }

  void setBio(String value) {
    Log.message(_tag, "setBio: $value");
    _updateUser((user) => user.bio = value);
  }

  void _updateUser(Function(UserBuilder) updates) async {
    Log.message(_tag, "_updateUser: $updates");

    // firebasePath.update(serialize(updatedUser) as Map<String, Object>);
  }
}

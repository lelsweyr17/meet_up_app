import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  factory User({
    String? id,
    String? name,
    String? bio,
    String? email,
    String? photo,
  }) =>
      _$User(
        (b) => b
          ..id = id
          ..name = name ?? ""
          ..bio = bio ?? ""
          ..email = email
          ..photo = photo,
      );

  User._();

  static Serializer<User> get serializer => _$userSerializer;

  String? get id;

  String? get name;

  String? get email;

  String? get photo;

  String? get bio;
}

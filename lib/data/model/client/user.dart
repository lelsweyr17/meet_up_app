import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<User> get serializer => _$userSerializer;

  factory User({
    required int version,
    required String id,
    String name = "",
    String bio = "",
    String? email,
    String? photo,
  }) =>
      _$User(
        (b) => b
          ..id = id
          ..name = name
          ..bio = bio
          ..email = email
          ..version = version
          ..photo = photo,
      );

  int get version;

  String get id;

  String get name;

  String get email;

  String? get photo;

  String? get bio;
}

import '../../domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required String uid,
    required String email,
    String? name,
  }) : super(
          uid: uid,
          name: name,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
      };
}

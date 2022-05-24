import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.uid,
    required this.email,
    this.name,
  });

  final String uid;
  final String email;
  final String? name;

  @override
  List<Object?> get props => [uid, name, email];
}

class User {
  User({
    required this.version,
    required this.id,
    this.name = "",
    this.email,
    this.photo,
  });

  final int version;
  final String id;
  final String name;
  final String? email;
  final String? photo;
}

class User {
  User({
    required this.id,
    this.name = "",
    this.email = "",
  });

  final String id;
  final String email;
  final String name;
}

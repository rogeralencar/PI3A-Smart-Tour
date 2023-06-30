class User {
  String? userId;
  String? name;
  String email;
  String password;
  List<String> interests;

  User({
    this.userId,
    this.name,
    required this.email,
    required this.password,
    required this.interests,
  });
}

class User {
  String? name;
  String email;
  String password;
  List<String> interests;

  User({
    this.name,
    required this.email,
    required this.password,
    required this.interests,
  });
}

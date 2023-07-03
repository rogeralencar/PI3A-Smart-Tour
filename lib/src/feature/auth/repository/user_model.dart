class User {
  int? userId;
  String name;
  String email;
  String password;
  List<String> interests;

  User({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.interests,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        userId = json['id'],
        password = json['password'],
        interests = json['interests'].split(',');

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'interests': interests,
      };
}

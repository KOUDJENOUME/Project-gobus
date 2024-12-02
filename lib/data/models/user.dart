class User {
  final String email;
  final String fullname;

  User({required this.email, required this.fullname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullname: json['fullname'],
    );
  }
}

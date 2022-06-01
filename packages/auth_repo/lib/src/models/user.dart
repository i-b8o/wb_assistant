class User {
  final String id;
  final String email;
  final String expires;
  final String type;
  final String username;
  final String password;

  const User(
      {required this.password,
      required this.id,
      required this.email,
      required this.expires,
      required this.type,
      required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'].toString(),
      email: json['Email'],
      expires: json['Expires'],
      type: json['Type'],
      username: json['Username'],
      password: json['Password'] ?? "",
    );
  }

  static const empty = User(
    id: "",
    email: "",
    expires: "",
    password: "",
    type: "",
    username: "",
  );
}

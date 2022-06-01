class Details {
  final String id;
  final String email;
  final String expires;
  final String type;
  final String username;
  final String password;

  const Details(
      {required this.password,
      required this.id,
      required this.email,
      required this.expires,
      required this.type,
      required this.username});

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['ID'].toString(),
      email: json['Email'],
      expires: json['Expires'],
      type: json['Type'],
      username: json['Username'],
      password: json['Password'] ?? "",
    );
  }

  static const empty = Details(
    id: "",
    email: "",
    expires: "",
    password: "",
    type: "",
    username: "",
  );
}

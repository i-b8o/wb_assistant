class Details {
  final String id;
  final String email;
  final String expires;
  final String type;
  final String username;

  Details(
      {required this.id,
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
    );
  }
}
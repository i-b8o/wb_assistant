class Account {
  final String id, type, expires;

  Account({required this.id, required this.type, required this.expires});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['ID'].toString(),
      type: json['Type'],
      expires: json['Expires'],
    );
  }
}

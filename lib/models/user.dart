import 'account.dart';

class User {
  final String id;
  final String username;
  final String email;

  final List<Account> accounts;

  User(
    this.id,
    this.username,
    this.email,
    this.accounts,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    var accountsObjJson = json['Accounts'] as List;
    List<Account> _accs =
        accountsObjJson.map((accJson) => Account.fromJson(accJson)).toList();

    return User(
      json['ID'].toString(),
      json['Username'],
      json['Email'],
      _accs,
    );
  }
}

class RegistrationResponseData {
  const RegistrationResponseData({required this.message, required this.user});
  final User user;
  final String message;

  factory RegistrationResponseData.fromJson(Map<String, dynamic> json) {
    return RegistrationResponseData(
      message: json['Message'].toString(),
      user: User.fromJson(json),
    );
  }
}

class LoginResponseData {
  final String? message;
  final User? user;
  const LoginResponseData({this.message, this.user});
  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    if (json['Accounts'] != null) {
      return LoginResponseData(
        user: User.fromJson(json),
      );
    }
    return LoginResponseData(
      message: json['Message'].toString(),
    );
  }
}

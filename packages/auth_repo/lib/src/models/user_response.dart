import 'package:auth_repo/src/models/user.dart';

class UserResponse {
  final User user;
  final int statusCode;
  UserResponse({
    required this.user,
    this.statusCode = 200,
  });
}

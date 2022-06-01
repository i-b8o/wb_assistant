// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:be_repo/src/models/details.dart';

import '../be_repo.dart';

class Response {
  final Details details;
  final String jwt;
  final int statusCode;
  final AuthenticationStatus authenticationStatus;
  Response({
    required this.authenticationStatus,
    required this.details,
    this.jwt = "",
    this.statusCode = 200,
  });
}

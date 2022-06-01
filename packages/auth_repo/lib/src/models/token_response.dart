class TokenResponse {
  String token;
  int statusCode;
  TokenResponse({required this.token, required this.statusCode});
  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(token: json['token'], statusCode: 200);
  }
}

class TokenMessage {
  String token;
  TokenMessage({
    required this.token,
  });
  factory TokenMessage.fromJson(Map<String, dynamic> json) {
    return TokenMessage(
      token: json['token'],
    );
  }
}

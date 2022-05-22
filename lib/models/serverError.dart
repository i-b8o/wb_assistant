class ServerErr {
  String message;
  ServerErr({
    required this.message,
  });
  factory ServerErr.fromJson(Map<String, dynamic> json) {
    return ServerErr(
      message: json['message'],
    );
  }
}

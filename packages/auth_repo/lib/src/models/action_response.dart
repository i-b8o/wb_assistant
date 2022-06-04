class ActionsResponse {
  String status;
  int statusCode;
  ActionsResponse({required this.status, required this.statusCode});
  factory ActionsResponse.fromJson(Map<String, dynamic> json) {
    return ActionsResponse(status: json['status'], statusCode: 200);
  }
}

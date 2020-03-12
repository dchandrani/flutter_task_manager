class LoginResponse {
  final bool error;
  final String message;
  final String name;
  final String email;
  final String apiKey;
  final String createdAt;

  LoginResponse(
      {this.error,
      this.message,
      this.name,
      this.email,
      this.apiKey,
      this.createdAt});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'],
      apiKey: json['apiKey'],
      createdAt: json['createdAt'],
      email: json['email'],
      name: json['name'],
    );
  }
}

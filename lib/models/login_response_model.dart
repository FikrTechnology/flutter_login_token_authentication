class LoginResponseModel {
  final String accessToken;
  final String refreshToken;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJon(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'], 
      refreshToken: json['refreshToken']
    );
  }
}
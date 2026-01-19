import 'package:dio/dio.dart';
import 'package:flutter_login_token_authentication/constants/app_constant.dart';
import 'package:flutter_login_token_authentication/models/login_request_model.dart';
import 'package:flutter_login_token_authentication/models/login_response_model.dart';

class ApiServices {
  final baseUrl = AppConstant.baseUrl;
  final dio = Dio();

  Future<LoginResponseModel> login(LoginRequestModel requestBody) async {
    final response = await dio.post(
      '$baseUrl/auth/login',
      data: requestBody.toJson(),
    );

    return LoginResponseModel.fromJon(response.data);
  }

}
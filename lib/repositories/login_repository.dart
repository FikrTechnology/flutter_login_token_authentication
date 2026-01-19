import 'package:flutter_login_token_authentication/models/login_request_model.dart';
import 'package:flutter_login_token_authentication/models/login_response_model.dart';
import 'package:flutter_login_token_authentication/services/api_services.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepository {
  final apiServices = ApiServices();

  Future<Either<String, LoginResponseModel>> login(LoginRequestModel requestBody,) async {
    try {
      final result = await apiServices.login(requestBody);

      return Right(result);
    } catch (e) {
      return Left('Login Failed');
    }
  } 
}
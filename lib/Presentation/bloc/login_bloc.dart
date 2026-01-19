
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_token_authentication/models/login_request_model.dart';
import 'package:flutter_login_token_authentication/models/login_response_model.dart';
import 'package:flutter_login_token_authentication/repositories/login_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repository = LoginRepository();

  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());

      final result = await repository.login(event.requestBody);

      result.fold(
        (errorMessage) => emit(LoginFailed(errorMessage: errorMessage)), 
        (loginData) => emit(LoginSuccess(loginData: loginData))
      );
    });
  }
}

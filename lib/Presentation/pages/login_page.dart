import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_token_authentication/Presentation/bloc/login_bloc.dart';
import 'package:flutter_login_token_authentication/Presentation/widgets/button_widget.dart';
import 'package:flutter_login_token_authentication/Presentation/widgets/login_textfield_widget.dart';
import 'package:flutter_login_token_authentication/models/login_request_model.dart';
import 'package:flutter_login_token_authentication/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Silahkan Login',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  LoginTextfieldWidget(
                    labelText: "Username",
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hasSuffix: false,
                  ),
                  const SizedBox(height: 16),
                  LoginTextfieldWidget(
                    labelText: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: isObscure,
                    hasSuffix: true,
                    onSuffixPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),

                  const SizedBox(height: 32),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        // Navigate to home page
                        Navigator.pushReplacementNamed(context, MyRoutes.home.name);
                      } else if (state is LoginFailed) {
                        showDialog(
                          context: context, 
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Login Failed"),
                              content: Text(state.errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text("OK")
                                )
                              ],
                            );
                          }
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ButtonWidget(
                          onPressed: () {
                            final requestBody = LoginRequestModel(
                              username: usernameController.text, 
                              password: passwordController.text, 
                              expiresInMins: 30
                            );

                            context.read<LoginBloc>().add(Login(requestBody: requestBody));
                          }, 
                          text: "Login",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

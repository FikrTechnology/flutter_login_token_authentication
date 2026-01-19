import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_token_authentication/Presentation/bloc/login_bloc.dart';
import 'package:flutter_login_token_authentication/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.login.name,
        routes: routes,
      )
    );
  }
}
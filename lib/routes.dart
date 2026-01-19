import 'package:flutter_login_token_authentication/Presentation/pages/home_page.dart';
import 'package:flutter_login_token_authentication/Presentation/pages/login_page.dart';

enum MyRoutes {
  login('/login'),
  home('/home');

  final String name;
  const MyRoutes(this.name);
}

final routes = {
  MyRoutes.login.name: (context) => const LoginPage(),
  MyRoutes.home.name: (context) => const HomePage(),
};
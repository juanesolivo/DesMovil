import 'package:flutter/material.dart';
import 'views/auth_screans/login_screen.dart';
import 'views/auth_screans/register_screen.dart';
import 'views/main_screens//main_screen.dart';

void main() => runApp(const AplicacionTienda());

class AplicacionTienda extends StatelessWidget {
  const AplicacionTienda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda App',
      initialRoute: '/inicioSesion',
      routes: {
        '/inicioSesion': (context) => const LoginScreen(),
        '/registro': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}

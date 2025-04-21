import 'package:flutter/material.dart';
import '../components/campo_texto_personalizado.dart';
import '../components/boton_autenticacion.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Simulación de autenticación exitosa
      print('Iniciar sesión con: ${_emailController.text}');

      // Redirige a MainScreen y elimina LoginScreen del historial
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CampoTextoPersonalizado(
                  controlador: _emailController,
                  textoSugerencia: 'Ingresa tu correo',
                  etiqueta: 'Correo',
                  iconoPrefijo: Icons.email,
                  tipoTeclado: TextInputType.emailAddress,
                  validador: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CampoTextoPersonalizado(
                  controlador: _passwordController,
                  textoSugerencia: 'Ingresa tu contraseña',
                  etiqueta: 'Contraseña',
                  iconoPrefijo: Icons.lock,
                  ocultarTexto: true,
                  validador: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                BotonAutenticacion(
                  texto: 'Iniciar Sesión',
                  alPresionar: _login,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro');
                  },
                  child: const Text('¿No tienes cuenta? Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

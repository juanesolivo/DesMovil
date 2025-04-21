import 'package:flutter/material.dart';
import '../components/campo_texto_personalizado.dart';
import '../components/boton_autenticacion.dart';
import '../../controllers/auth_Contoller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
// Rest of the code

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

   final _authController = AuthController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
        return;
      }
      _authController.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        fullName: _nameController.text,
      );
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
                  'Registro',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CampoTextoPersonalizado(
                  controlador: _nameController,
                  textoSugerencia: 'Ingresa tu nombre',
                  etiqueta: 'Nombre',
                  iconoPrefijo: Icons.person,
                  validador: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                CampoTextoPersonalizado(
                  controlador: _confirmPasswordController,
                  textoSugerencia: 'Confirma tu contraseña',
                  etiqueta: 'Confirmar Contraseña',
                  iconoPrefijo: Icons.lock,
                  ocultarTexto: true,
                  validador: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor confirma tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                BotonAutenticacion(
                  texto: 'Registrarse',
                  alPresionar: _register,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inicioSesion');
                  },
                  child: const Text('¿Ya tienes cuenta? Inicia sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
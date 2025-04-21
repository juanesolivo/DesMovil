import 'package:flutter/material.dart';

class CampoTextoPersonalizado extends StatelessWidget {
  final TextEditingController controlador;
  final String textoSugerencia;
  final String etiqueta;
  final IconData iconoPrefijo;
  final bool ocultarTexto;
  final TextInputType tipoTeclado;
  final String? Function(String?)? validador;

  const CampoTextoPersonalizado({
    Key? key,
    required this.controlador,
    required this.textoSugerencia,
    required this.etiqueta,
    required this.iconoPrefijo,
    this.ocultarTexto = false,
    this.tipoTeclado = TextInputType.text,
    this.validador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      keyboardType: tipoTeclado,
      obscureText: ocultarTexto,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: textoSugerencia,
        labelText: etiqueta,
        prefixIcon: Icon(iconoPrefijo),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validador,
    );
  }
}
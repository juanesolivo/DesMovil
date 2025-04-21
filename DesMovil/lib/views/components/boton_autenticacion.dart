import 'package:flutter/material.dart';

class BotonAutenticacion extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;
  final Color? colorFondo;
  final Color? colorTexto;
  final double? size; // Add this line to address 'Size' error

  const BotonAutenticacion({
    Key? key,
    required this.texto,
    required this.alPresionar,
    this.colorFondo = Colors.blue,
    this.colorTexto = Colors.white,
    this.size, // Add this optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key, // Add this to address key parameter
      onPressed: alPresionar,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorFondo,
        minimumSize: Size(
          size ?? double.infinity, // Use size if provided, otherwise
          // full width
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: colorTexto,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
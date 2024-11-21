import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ejercicio_restaurante/ui/interfaz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Añade el key constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de Volumen de Cilindro",
      home: VolumenPage(), // Página para calcular el volumen
    );
  }
}

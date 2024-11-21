import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica/calculadora_volumen.dart';

class VolumenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VolumenPageState();
}

class VolumenPageState extends State<VolumenPage> {
  final TextEditingController _radioController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  // Variable para mostrar el resultado
  String _resultado = '';

  // Instancia de la clase
  final CalculadoraVolumen _calculadora = CalculadoraVolumen();

  // Método para calcular el volumen
  void _calcularVolumen() {
    final radio = double.tryParse(_radioController.text);
    final altura = double.tryParse(_alturaController.text);

    // Validaciones
    if (radio == null || radio <= 0 || altura == null || altura <= 0) {
      setState(() {
        _resultado = 'Ingrese valores válidos para radio y altura.';
      });
    } else {
      // Calcular volumen
      final resultadoVolumen = _calculadora.calcularVolumen(radio, altura);
      setState(() {
        _resultado = 'El volumen del cilindro es: ${resultadoVolumen.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
            'Calculadora Volumen Cilindro',
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        backgroundColor: const Color(0xFFCD5C5C),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _radioController,
                    decoration: InputDecoration(
                      labelText: 'Radio: ',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _alturaController,
                    decoration: InputDecoration(
                      labelText: 'Altura: ',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _calcularVolumen,
                    child: Text(
                      'Calcular Volumen',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                      backgroundColor: Color(0xFFCD5C5C), // Color de fondo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Bordes más redondeados
                      ),

                    ),
                  ),

                ],
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Icon(
                    Icons.calculate,
                    size: 100,
                    color: Color(0xFFCD5C5C),
                  ),
                  SizedBox(height: 20.0),
                  // Mostrar el resultado debajo del cilindro
                  Text(
                    _resultado,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCD5C5C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/imc/pages/home.dart';

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora de IMC',
      home: Home(),
    );
  }
}

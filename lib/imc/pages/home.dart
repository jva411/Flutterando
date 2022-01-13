import 'package:flutter/material.dart';

class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    final TextEditingController _weightController = TextEditingController();
    final TextEditingController _heightController = TextEditingController();
    String _infoTexto = "Informe os seus dados";
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();



    void _resetFields() {
        setState(() {
            _weightController.text = "";
            _heightController.text = "";
            _infoTexto = "Informe os seus dados";
			_formKey = GlobalKey<FormState>();
        });
    }

    void _calculateIMC() {
        if (!_formKey.currentState!.validate()) return;
        setState(() {
            double weight = double.parse(_weightController.text);
            double height = double.parse(_heightController.text) / 100;
            double imc = weight / (height * height);
            
            if (imc < 18.6) {
                _infoTexto = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
            } else if (imc < 24.9) {
                _infoTexto = "Peso Ideal (${imc.toStringAsPrecision(3)})";
            } else if (imc < 29.9) {
                _infoTexto = "Levemente acima do Peso (${imc.toStringAsPrecision(3)})";
            } else if (imc < 34.9) {
                _infoTexto = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
            } else if (imc < 39.9) {
                _infoTexto = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
            } else {
                _infoTexto = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Calculadora de IMC'),
                centerTitle: true,
                backgroundColor: Colors.green,
                actions: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: _resetFields,
                    )
                ],
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            const Icon(Icons.person_outline, size: 120.0, color: Colors.green),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(labelText: 'Peso (kg)', labelStyle: TextStyle(color: Colors.green)),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                                controller: _weightController,
                                validator: (value) {
                                    if (value!.isEmpty) {
                                        return 'Insira seu Peso';
                                    } else if (double.tryParse(value) == null || double.parse(value) < 0) {
                                        return 'Insira um valor válido';
                                    }
                                },
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(labelText: 'Altura (cm)', labelStyle: TextStyle(color: Colors.green)),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.green, fontSize: 25.0),
                                controller: _heightController,
                                validator: (value) {
                                    if (value!.isEmpty) {
                                        return 'Insira sua Altura';
                                    } else if (double.tryParse(value) == null || double.parse(value) < 0) {
                                        return 'Insira um valor válido';
                                    }
                                },
                            ),
                            Container(
                                height: 50.0,
                                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                child: ElevatedButton(
                                    child: const Text('Calcular', style: TextStyle(color: Colors.white, fontSize: 25.0)),
                                    onPressed: _calculateIMC,
                                    style: ElevatedButton.styleFrom(primary: Colors.green),
                                )
                            ),
                            Text(_infoTexto,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.green, fontSize: 25.0)
                            ),
                        ],
                    )
                )
            )
        );
    }
}

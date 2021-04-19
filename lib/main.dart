import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _textHome = "CRUDFlutter";
  final _controladorCampoNumeroConta = "asd";
  final _rotuloCampoNumeroConta = "0.00";
  final _dicaCampoValor = "0000";
  final _controladorCampoValor = "0000";
  final _textoBotaoConfirmar = "Confirmar";

  @override
  Widget build(BuildContext context) {
    var textField = TextField();
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_textHome),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  // controlador: _controladorCampoNumeroConta,
                  rotulo: _rotuloCampoNumeroConta,
                  dica: _dicaCampoValor,
                  icone: null),
              Editor(
                //controlador: _controladorCampoValor,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    //final int numeroConta =
    // int.tryParse(_controladorCampoNumeroConta.text);
    //final double valor = double.tryParse(_controladorCampoValor.text);

    //if (numeroConta != null && valor != null) {
    //final transferenciaRecebida = Transferencia(valor, numeroConta);
    // Navigator.pop(context, transferenciaRecebida);
    //}
  }
}

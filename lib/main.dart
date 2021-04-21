import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/pages/landingpage.dart';

import 'components/editor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('An error! ${snapshot.error.toString()}');
              return Text('Something went wrong!');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      User user = snapshot.data;

                      if (user == null) {
                        return Login();
                      } else {
                        // returnlandingpage();
                      }
                    }
                  });

              //Login();
              //MyHomePage(title: 'My App!');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class Login extends StatelessWidget {
  final _textHome = "CRUDFlutter";
  final _controladorCampoNumeroConta = "Senha";
  final _rotuloCampoNumeroConta = "Usuário";
  final _dicaCampoSenha = "Senha";
  final _dicaCampoLogin = "Login";
  final _controladorCampoValor = "0000";
  final _textoBotaoConfirmar = "Confirmar";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_textHome),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                // controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoLogin,
                icone: null),
            Editor(
              //controlador: _controladorCampoValor,
              rotulo: _controladorCampoNumeroConta,
              dica: _dicaCampoSenha,
              icone: null,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }
}

void _criaTransferencia(BuildContext context) {
  DatabaseReference _testRef =
      FirebaseDatabase.instance.reference().child("test");
  _testRef.set("Hello world ${Random().nextInt(100)}");
  //final int numeroConta =
  // int.tryParse(_controladorCampoNumeroConta.text);
  //final double valor = double.tryParse(_controladorCampoValor.text);

  //if (numeroConta != null && valor != null) {
  //final transferenciaRecebida = Transferencia(valor, numeroConta);
  // Navigator.pop(context, transferenciaRecebida);
  //}
}

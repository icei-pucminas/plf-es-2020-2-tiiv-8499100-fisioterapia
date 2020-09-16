import 'package:flutter/material.dart';
import 'acessoConta/login.dart';
import 'acessoConta/cadastro.dart';
import 'contaFisioterapeuta/controller/dashboard.dart';

void main() {
  runApp(FisioApp());
}

class FisioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _indLayout = 0;
  var _layoutSelecionado;

/*
  void _mudarLayout(bool requisicao) {
    setState(() {
      if (requisicao) {
        _numLayout++;
      } else {
        _numLayout--;
      }
    });
  }
*/
/*
  Widget _selecionarLayout() {
    switch (_numLayout) {
      case 0:
        _layoutSelecionado = Login(_mudarLayout);
        break;
      case 1:
        _layoutSelecionado = Cadastro(_mudarLayout);
        break;
    }
    return _layoutSelecionado;
  }
*/

  void _pegarIndice(int indice) {
    setState(() {
      _indLayout = indice;
    });
  }

  Widget _selecionarLayout() {
    switch (_indLayout) {
      case 0:
        _layoutSelecionado = Login(_pegarIndice);
        break;
      case 1:
        _layoutSelecionado = Cadastro(_pegarIndice);
        break;
      case 2:
        _layoutSelecionado = DashBoard(_pegarIndice);
        break;
    }
    return _layoutSelecionado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selecionarLayout(),
    );
  }
}

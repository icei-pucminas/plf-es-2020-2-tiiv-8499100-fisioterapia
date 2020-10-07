import 'package:flutter/material.dart';
import 'package:projeto_fisio/screens/auth_screen.dart';
import 'package:projeto_fisio/screens/auth_voluntary.dart';
import 'package:projeto_fisio/screens/calc_Rq.dart';
import 'package:projeto_fisio/screens/calc_Star.dart';
import 'package:projeto_fisio/screens/calc_Y.dart';
import 'package:projeto_fisio/screens/home_screen.dart';
//import 'package:projeto_fisio/screens/auth_voluntary.dart';
//import 'package:projeto_fisio/screens/formScreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fisioterapia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.black,
        accentColor: Colors.black,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.cyan,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _indiceLayout = 0;
  var _layoutSelecionado;

  void _pegarIndice(int indice) {
    setState(() {
      _indiceLayout = indice;
    });
  }

  Widget _selecionarLayout() {
    switch (_indiceLayout) {
      case 0:
        _layoutSelecionado = AuthScreen(_pegarIndice);
        break;
      case 1:
        _layoutSelecionado = HomeScreen(_pegarIndice);
        break;
      case 2:
        _layoutSelecionado = VoluntaryForm(_pegarIndice);
        break;
      case 3:
        _layoutSelecionado = CalcRQ(_pegarIndice);
        break;
      case 4:
        _layoutSelecionado = CalcY(_pegarIndice);
        break;
      case 5:
        _layoutSelecionado = CalcStar(_pegarIndice);
        break;
      default:
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

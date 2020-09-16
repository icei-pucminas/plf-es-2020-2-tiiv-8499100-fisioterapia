import 'package:FisioApp/contaFisioterapeuta/view/auxiliares_List.dart';
import 'package:FisioApp/contaFisioterapeuta/view/menuLateral.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final void Function(int) mudarPagina;
  DashBoard(this.mudarPagina);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _indiceMenu = 3;
  var _layoutSelecionado;

  void _obterIndiceMenu(int indice) {
    setState(() {
      _indiceMenu = indice;
    });
  }

  Widget alterarTelasDashboard() {
    switch (_indiceMenu) {
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        _layoutSelecionado = Auxiliares(_obterIndiceMenu);
        break;
      default:
    }
    return _layoutSelecionado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(widget.mudarPagina),
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          'FisioApp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => widget.mudarPagina(0),
          )
        ],
      ),
      body: Container(
        child: alterarTelasDashboard(),
      ),
    );
  }
}

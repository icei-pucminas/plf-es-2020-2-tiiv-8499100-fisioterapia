import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) mudarPagina;
  HomeScreen(this.mudarPagina);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
        backgroundColor: Colors.grey,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.white, Colors.grey])),
                child: Text('Menu Principal')),
            CustomTile(
                Icons.account_circle, 'Cadastrar Atleta', () => mudarPagina(2)),
            CustomTile(Icons.add_circle, 'Ridigez de RQ', () => mudarPagina(3)),
            CustomTile(Icons.add_circle, 'Y Test', () => mudarPagina(4)),
            CustomTile(Icons.add_circle, 'Star Test', () => mudarPagina(5)),
            CustomTile(Icons.arrow_back, 'Sair', () => mudarPagina(0)),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Text(text, style: TextStyle(fontSize: 16.0)),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

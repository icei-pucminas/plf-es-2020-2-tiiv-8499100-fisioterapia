import 'package:FisioAux/utils/app_routes.dart';
import 'package:FisioAux/widgets/cardPedido.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FisioApp'),
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
              Icons.account_circle,
              'Cadastrar Atleta',
              () => Navigator.of(context).pushNamed(
                AppRoutes.AUTH_VOLUNTARY,
              ),
            ),
            CustomTile(
              Icons.account_circle,
              'Adicionar Fisioterapeuta',
              () => Navigator.of(context).pushNamed(
                AppRoutes.AUTH_VOLUNTARY,
              ),
            ),
            /*  CustomTile(Icons.add_circle, 'Ridigez de RQ', () {}),
            CustomTile(Icons.add_circle, 'Y Test', () {}),
            CustomTile(Icons.add_circle, 'Star Test', () {}),
            CustomTile(Icons.add_circle, 'Hop Test', () {}),
            CustomTile(Icons.add_circle, 'Closed Kinect Test', () {}),
            CustomTile(Icons.add_circle, 'Dirsoflexão Test D/E ', () {}),
            CustomTile(Icons.add_circle, 'Single Leg Bridge Test', () {}),*/
            CustomTile(Icons.settings, 'Configurações', () {}),
            CustomTile(Icons.arrow_back, 'Sair', () {}),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: CardPedido(),
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

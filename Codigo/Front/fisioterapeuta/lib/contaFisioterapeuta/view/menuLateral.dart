import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final void Function(int) mudarPagina;
  MenuLateral(this.mudarPagina);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 5,
                right: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Gustavo',
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
            ),
            title: Text(
              'Fichas',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.assignment_turned_in,
            ),
            title: Text(
              'Testes',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.group,
            ),
            title: Text(
              'Auxiliares',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'Configurações',
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text(
              'Sair',
            ),
            onTap: () => mudarPagina(0),
          ),
        ],
      ),
    );
  }
}

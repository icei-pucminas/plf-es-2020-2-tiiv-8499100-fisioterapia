import 'package:FisioAux/acessoConta/login.dart';
import 'package:FisioAux/provider/auth.dart';
import 'package:FisioAux/view/auxiliarScreenPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOuFicha extends StatefulWidget {
  @override
  _AuthOuFichaState createState() => _AuthOuFichaState();
}

class _AuthOuFichaState extends State<AuthOuFicha> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return auth.isAuth ? HomeScreen() : Login();
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_fisio/acessoConta/login.dart';
import 'package:projeto_fisio/provider/auth.dart';
import 'package:projeto_fisio/view/auxiliarScreenPrincipal.dart';
import 'package:provider/provider.dart';

class AuthOuFicha extends StatefulWidget {
  @override
  _AuthOuFichaState createState() => _AuthOuFichaState();
}

class _AuthOuFichaState extends State<AuthOuFicha> {
  //var escolha = true;
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return auth.isAuth ? HomeScreen() : Login();
  }
}

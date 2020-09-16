import 'package:flutter/material.dart';
import 'package:FisioApp/contaFisioterapeuta/model/typeAuxiliares.dart';

class AuxiliaresController extends StatefulWidget {
  @override
  _AuxiliaresControllerState createState() => _AuxiliaresControllerState();
}

final List<Auxiliares> _auxiliares = [
  Auxiliares(
    id: 001,
    nome: 'Isadora',
    email: 'isadora33@gmail.com',
    examesEnviados: 5,
    examesRealizados: 5,
    examesPendentes: 0,
  ),
  Auxiliares(
      id: 002,
      nome: 'José',
      email: 'jose93@gmail.com',
      examesEnviados: 6,
      examesRealizados: 5,
      examesPendentes: 1),
  Auxiliares(
    id: 003,
    nome: 'Roberto',
    email: 'roberto9202@gmail.com',
    examesEnviados: 3,
    examesRealizados: 3,
    examesPendentes: 0,
  ),
];

class _AuxiliaresControllerState extends State<AuxiliaresController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

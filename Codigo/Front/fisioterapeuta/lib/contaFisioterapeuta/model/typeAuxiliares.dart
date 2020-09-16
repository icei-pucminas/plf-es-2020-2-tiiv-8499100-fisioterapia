import 'package:flutter/cupertino.dart';

class Auxiliares {
  final int id;
  final String nome;
  final String email;
  final int examesEnviados;
  final int examesRealizados;
  final int examesPendentes;

  Auxiliares({
    @required this.id,
    @required this.nome,
    @required this.email,
    @required this.examesEnviados,
    @required this.examesRealizados,
    @required this.examesPendentes,
  });
}

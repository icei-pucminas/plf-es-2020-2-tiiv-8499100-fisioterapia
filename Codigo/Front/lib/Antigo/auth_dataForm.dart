//import 'package:flutter/foundation.dart';

enum AuthMode {
  MENU,
  INFO,
}

class AuthDataV {
  String name;
  String idade;
  String ladoDominante;
  String numero;
  String posicao;
  String peso;
  String altura;
  String email;
  String celular;
  String profissao;

  AuthMode _mode = AuthMode.MENU;

  bool get isMenu {
    return _mode == AuthMode.MENU;
  }

  bool get isInfo {
    return _mode == AuthMode.INFO;
  }

  void toggleModeV() {
    _mode = _mode == AuthMode.MENU ? AuthMode.INFO : AuthMode.MENU;
  }
}

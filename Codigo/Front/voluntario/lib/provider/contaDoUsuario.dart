import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ContaUsuario with ChangeNotifier {
  String _token;
  String _idUser;
  String codVinculo;

  ContaUsuario(this._token, this._idUser);

  Future<void> vincComFisio(String codigo) async {
    final url = 'https://fisioterapiaapp1.azurewebsites.net/Auxiliar/vincular';

    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: json.encode({
        "Id": int.parse(_idUser),
        "codVinculo": codigo,
      }),
    );

    final responseBody = json.decode(response.body);
    print(responseBody);
    if (responseBody['error'] != null) {
      print('Sem resposta');
    } else {
      print(responseBody['message']);
    }
    return Future.value();
  }
}

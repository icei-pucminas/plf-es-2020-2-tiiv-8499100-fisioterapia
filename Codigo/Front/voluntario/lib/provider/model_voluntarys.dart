import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Model {
  String firstName;
  String lastName;
  String email;
  String idade;
  String sideDominant;
  String number;
  String position;
  String weight;
  String height;
  String cellphone;
  String profession;

  Model({
    this.firstName,
    this.lastName,
    this.email,
    this.idade,
    this.sideDominant,
    this.number,
    this.position,
    this.weight,
    this.height,
    this.cellphone,
    this.profession,
  });
}

class PedidoCadastroCard {
  String nomeFisio;
  String nomeAtl;
  bool status;
  PedidoCadastroCard({this.nomeFisio, this.nomeAtl, this.status = false});
}

class ModelsVoluntarys with ChangeNotifier {
  String _userId;
  String _token;
  ModelsVoluntarys(this._token, this._userId);

  List<PedidoCadastroCard> pedidosCarregados = [];
  List<Model> volTeste = [];
  Model atletaCadastrado;
  List<Model> voluntarys = [];

  Future<void> receberPedido() async {
    final response = await http
        .get('https://fisioterapiaapp1.azurewebsites.net/Pedidos/$_userId');
    List<dynamic> data = json.decode(response.body);

    if (data != null) {
      pedidosCarregados.clear();
      data.forEach((pedido) {
        pedidosCarregados.add(PedidoCadastroCard(
          nomeAtl: pedido['nomeAtleta'],
          nomeFisio: pedido['fisioterapeuta'],
        ));
      });
    }
    pedidosCarregados.forEach((element) {
      print('nome do atleta : ${element.nomeAtl}');
    });
    return Future.value();
  }

  Future<void> enviarVoluntarios(Model atleta) async {
    final url =
        'https://fisioterapiaapp1.azurewebsites.net/Atleta/cadastrarAtleta';
    print('aqui');

    final response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          'Nome': atleta.firstName,
          'Email': atleta.email,
          'Idade': '2020-10-23',
          'LadoDominante': atleta.sideDominant,
          'Numero': int.parse(atleta.number),
          'Posicao': atleta.position,
          'Peso': double.parse(atleta.weight),
          'Altura': double.parse(atleta.height),
          'Celular': atleta.cellphone,
          'Profissao': atleta.profession,
          'OcorreuContusao': true,
        }));

    notifyListeners();

    return Future.value();
  }

  Future<void> retornarAtleta() async {
    final response = await http
        .get('https://fisioterapiaapp1.azurewebsites.net/Atleta/getallatleta');
    List<dynamic> data = json.decode(response.body);
    print('lista de atletas : ');
    print(data);
    notifyListeners();
    return Future.value();
  }
}

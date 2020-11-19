import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TestePendente {
  String nome;
  int idExame;
  int idTeste;
  String valor1 = '';
  String valor2 = '';
  String valor3 = '';
  String valor4 = '';
  String valor5 = '';
  String valor6 = '';
  String valor7 = '';
  String valor8 = '';
  String status;
  String resultadoEsquedo;
  String resultadoDireito;
  bool pendente;
  TestePendente({
    this.idExame,
    this.idTeste,
    this.nome,
    this.pendente = true,
  });
}

class FichaAux {
  int idExame;
  String nomeAtleta;
  String nomeFisioterapeuta;
  List<TestePendente> testes = [];
  FichaAux({
    this.idExame,
    this.nomeAtleta,
    this.nomeFisioterapeuta,
    this.testes,
  });
}

class FichasAux with ChangeNotifier {
  List<FichaAux> listaFichas = [];
  String _userId;
  String _token;
  FichasAux(this._token, this._userId);
  List<FichaAux> listaPedido = [];

  Future<void> receberSolicitacao() async {
    final id = int.parse(_userId);
    final response =
        await http.get('http://fisioterapiaapp1.azurewebsites.net/Exames/$id');
    listaPedido.clear();
    List<dynamic> data = json.decode(response.body);
    if (data != null) {
      data.forEach((exame) {
        listaPedido.add(
          FichaAux(
            idExame: exame['idExame'],
            testes: (exame['idsExamesExercicios'] as List<dynamic>)
                .map((testeItem) {
              return TestePendente(
                idExame: testeItem['idExame'],
                idTeste: testeItem['idExercios'],
                nome: testeItem['nome'],
              );
            }).toList(),
            nomeAtleta: exame['nomeAtleta'],
            nomeFisioterapeuta: exame['nomeFisioteraputa'],
          ),
        );
      });
      notifyListeners();
    }

    return Future.value();
  }

  TestePendente inserirRespostaTesteDoisValores(int exameId, int testeId,
      String valor1, String valor2, String resultado1, String resultado2) {
    TestePendente testeAlterado;

    listaPedido.forEach((exame) {
      if (exame.idExame == exameId) {
        exame.testes.forEach((teste) {
          if (teste.idTeste == testeId) {
            teste.valor1 = valor1;
            teste.valor2 = valor2;
            teste.resultadoDireito = resultado1;
            teste.resultadoEsquedo = resultado2;
            teste.pendente = false;

            testeAlterado = teste;
          }
        });
      }
    });
    notifyListeners();
    return testeAlterado;
  }

  TestePendente inserirRespostaTesteOitoValores(
      int exameId,
      int testeId,
      String valor1,
      String valor2,
      String valor3,
      String valor4,
      String valor5,
      String valor6,
      String valor7,
      String valor8,
      String resultado1,
      String resultado2) {
    TestePendente testeAlterado;
    listaPedido.forEach((exame) {
      if (exame.idExame == exameId) {
        exame.testes.forEach((teste) {
          if (teste.idTeste == testeId) {
            teste.valor1 = valor1;
            teste.valor2 = valor2;
            teste.valor3 = valor3;
            teste.valor4 = valor4;
            teste.valor5 = valor5;
            teste.valor6 = valor6;
            teste.valor7 = valor7;
            teste.valor8 = valor8;
            teste.resultadoDireito = resultado1;
            teste.resultadoEsquedo = resultado2;
            teste.pendente = false;
            testeAlterado = teste;
          }
        });
      }
    });
    notifyListeners();
    return testeAlterado;
  }

  Future<void> enviarExerciciosRespondidos(
      TestePendente testeRespondido) async {
    final response = await http.post(
      'http://fisioterapiaapp1.azurewebsites.net/Exercicios/Responder',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        'IdExame': testeRespondido.idExame,
        'IdExercicio': testeRespondido.idTeste,
        'Valor1': testeRespondido.valor1,
        'Valor2': testeRespondido.valor2,
        'Valor3': testeRespondido.valor3,
        'Valor4': testeRespondido.valor4,
        'Valor5': testeRespondido.valor5,
        'Valor6': testeRespondido.valor6,
        'Valor7': testeRespondido.valor7,
        'Valor8': testeRespondido.valor8,
        'Resultado1': testeRespondido.resultadoDireito,
        'Resultado2': testeRespondido.resultadoEsquedo,
      }),
    );

    return Future.value();
  }
}

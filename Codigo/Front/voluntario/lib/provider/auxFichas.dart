import 'package:flutter/cupertino.dart';

class TestePendente {
  String nome;
  String resultado;
  bool pendente;
  TestePendente({
    this.nome,
    this.resultado,
    this.pendente = false,
  });
}

class FichaAux {
  String idFisio;
  String idAux;
  String idAtleta;
  String nomeFisio;
  String nomeAtleta;
  List<TestePendente> testes = [];
  FichaAux({
    this.idFisio,
    this.idAux,
    this.idAtleta,
    this.nomeFisio,
    this.nomeAtleta,
    this.testes,
  });
}

class FichasAux with ChangeNotifier {
  List<FichaAux> listaFichas = [];

  List<FichaAux> listaTeste = [
    new FichaAux(nomeFisio: 'Alex', nomeAtleta: 'Arthur', testes: [
      new TestePendente(nome: 'Rigidez de RQ', resultado: 'pendente'),
      new TestePendente(nome: 'Y Test', resultado: 'pendente'),
      new TestePendente(nome: 'Star Test', resultado: 'pendente'),
    ]),
    new FichaAux(nomeFisio: 'Alex', nomeAtleta: 'Bruna', testes: [
      new TestePendente(nome: 'Rigidez de RQ', resultado: 'pendente'),
      new TestePendente(nome: 'Y Test', resultado: 'pendente'),
    ]),
    new FichaAux(nomeFisio: 'Alex', nomeAtleta: 'Caique', testes: [
      new TestePendente(nome: 'Rigidez de RQ', resultado: 'pendente'),
      new TestePendente(nome: 'Y Test', resultado: 'pendente'),
      new TestePendente(nome: 'Star Test', resultado: 'pendente'),
    ]),
    new FichaAux(nomeFisio: 'Alex', nomeAtleta: 'Sofia', testes: [
      new TestePendente(nome: 'Rigidez de RQ', resultado: 'pendente'),
    ]),
  ];

  FutureBuilder<void> receberSolicitacao() {}

  FutureBuilder<void> enviarFichaPreenchida() {}

  FutureBuilder<void> deletarFichaSolicitada() {}
}

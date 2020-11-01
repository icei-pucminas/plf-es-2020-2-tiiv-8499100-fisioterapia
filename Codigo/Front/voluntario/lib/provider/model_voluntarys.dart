import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

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

class PedidoCadastro {
  String nomeFisio;
  String nomeAtl;
  String status;
}

class ModelsVoluntarys with ChangeNotifier {
  //String url = 'https://flutter-testereq.firebaseio.com/'
  List<Model> voluntarys = [];
  List<Model> volTeste = [];

  void enviarVoluntarios(Model voluntary) {
    voluntarys.add(voluntary);
    //post(url)
    notifyListeners();
  }

  Model retornarUltimoModel() {
    print('esta retornando');
    return voluntarys[voluntarys.length - 1];
  }
}

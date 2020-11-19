import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_fisio/excecao/excecao_Acesso.dart';
import 'package:projeto_fisio/utils/app_routes.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> signup(
    String nome,
    String email,
    String senha,
    String confirmacao,
    String cpf,
    String instituicao,
    String periodo,
  ) async {
    final url = 'https://fisioterapiaapp1.azurewebsites.net/Auxiliar/register';
    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        'Nome': nome,
        'Email': email,
        'Senha': senha,
        'ConfirmarSenha': confirmacao,
        'Instituicao': instituicao,
        'Periodo': int.parse(periodo),
        'DataDeNascimento': '2020-10-30',
        'CPF': cpf,
      }),
    );
    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      notifyListeners();
    }
    print('deu2');
    return Future.value();
  }

  Future<void> login(String email, String senha) async {
    print('entrou no auth');
    final url = 'https://fisioterapiaapp1.azurewebsites.net/Usuario/login';
    var response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        "Email": email,
        "Senha": senha,
      }),
    );
    final responseBody = json.decode(response.body);

    if (responseBody['message'] != null) {
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      print(' fora  $responseBody'); // imprime oque esta no response
      print('token fora : ${responseBody['jwtToken']}');
      print('id fora : ${responseBody['id']}');
      _userId = responseBody['id'].toString();
      _token = responseBody['jwtToken'];

      notifyListeners();
    }
    print('deu2');
    return Future.value();
  }

  logout(context) {
    print('dentro');
    _token = null;
    _userId = null;
    print('token valor :  $token');
    Navigator.of(context).popAndPushNamed(AppRoutes.AUTHOUFICHAS);
  }
}

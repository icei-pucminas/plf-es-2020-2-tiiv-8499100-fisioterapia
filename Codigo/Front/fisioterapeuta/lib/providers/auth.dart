import 'dart:convert';
import 'package:FisioApp/excecao/excecao_Acesso.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  String confirmacaoMensagem;
 // DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null /*&&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())*/) {
      return _token;
    } else {
      return null;
    }
  }
  Future<void> _authenticate(
      String email, String senha, String urlSegment) async {
        print('entrou no auth');
    final url ='https://fisioterapiaapp.azurewebsites.net/Usuario/login';
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
    if(response == null) print('nao chamour');
    else print('chamou');
    final responseBody = json.decode(response.body);
    if (responseBody['message'] != null) {
      print(' dentro ${responseBody['message']}');
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      print(' fora  $responseBody'); // imprime oque esta no response
      print('token fora : ${responseBody['jwtToken']}');
      print('id fora : ${responseBody['id']}');
      _userId = responseBody['id'].toString();
      _token = responseBody['jwtToken'];
     /* _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
              responseBody['expiresIn']), // a soma da a data de expiracao
        ),
      );*/
      print('deu1');
      notifyListeners();
    }
    print('deu2');
    return Future.value();
  }

  Future<void> _authenticateCadastro( String nome,
      String email, String senha, String confirmacao, String urlSegment) async {
        print('entrou no auth');
    final url ='https://fisioterapiaapp.azurewebsites.net/Usuario/register';
    var response = await http.post(
      url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
      body: json.encode({
          "Titulo" :"Mr",
          "Nome" : nome,
          "Email": email,
          "Senha": senha,
          "ConfirmaSenha" : confirmacao,
          "AceitoTermos":true,
      },),
      );

      final responseBody = json.decode(response.body);
       print(' fora  $responseBody');
       confirmacaoMensagem = responseBody['message'];
      }


  Future<void> signup(String nome,String email, String senha, String confirmacao) async {
   //print(' nome : $nome'); print('email : $email');print(' senha : $senha');print(' confirmacao $confirmacao');
    return _authenticateCadastro(nome,email, senha,confirmacao, 'register');
  }
  Future<void> login(String email, String senha) async {

    return _authenticate(email, senha, 'login');
  }
}

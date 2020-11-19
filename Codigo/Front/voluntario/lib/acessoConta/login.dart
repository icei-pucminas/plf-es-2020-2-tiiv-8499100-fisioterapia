//import 'package:FisioApp/contaFisioterapeuta/controller/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:projeto_fisio/excecao/excecao_Acesso.dart';
import 'package:projeto_fisio/provider/auth.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  final _senhaController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  final Map<String, String> _authData = {
    'nome': '',
    'email': '',
    'senha': '',
    'confirmacao': '',
    'cpf': '',
    'instituicao': '',
    'periodo': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Cadastro realizado!'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoutes.LOGIN);
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (_authMode == AuthMode.Login) {
        await auth.login(
          _authData["email"],
          _authData["senha"],
        );
      } else {
        await auth.signup(
          _authData["nome"],
          _authData["email"],
          _authData["senha"],
          _authData["confirmacao"],
          _authData["cpf"],
          _authData["instituicao"],
          _authData["periodo"],
          //   _authData["confirmacao"],
        );
        //_showConfirmDialog(auth.confirmacaoMensagem);
      }
    } on ExcecaoAcesso catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado !");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAutMod() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white30,
        child: Container(
          margin: EdgeInsets.only(
            top: _authMode == AuthMode.Login ? 60 : 20,
            left: 40,
            right: 40,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            height: 650,
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'FisioApp',
                        style: TextStyle(
                          color: Colors.teal[600],
                          fontSize: _authMode == AuthMode.Login ? 50 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe um nome';
                          }
                          return null;
                        },
                        onSaved: (value) => _authData['nome'] = value,
                      ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Informe um e-mail válido ! ';
                        }
                        return null;
                      },
                      onSaved: (value) => _authData['email'] = value,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      controller: _senhaController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Informe uma senha válida';
                        }
                        return null;
                      },
                      onSaved: (value) => _authData['senha'] = value,
                    ),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirmar Senha",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        onSaved: (value) => _authData['confirmacao'] = value,
                      ),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Cpf",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o Cpf';
                          }
                          return null;
                        },
                        onSaved: (value) => _authData['cpf'] = value,
                      ),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Período",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o Período';
                          }
                          return null;
                        },
                        onSaved: (value) => _authData['periodo'] = value,
                      ),
                    if (_authMode == AuthMode.Signup)
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Instituição",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe a instituição';
                          }
                          return null;
                        },
                        onSaved: (value) => _authData['instituicao'] = value,
                      ),
                    SizedBox(
                      height: _authMode == AuthMode.Login ? 100 : 5,
                    ),
                    if (_isLoading)
                      CircularProgressIndicator()
                    else
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.tealAccent[700],
                        textColor: Colors.grey[100],
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                        child: Text(
                          _authMode == AuthMode.Login ? 'Entrar' : 'Cadastrar',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onPressed: _submit,
                      ),
                    FlatButton(
                      onPressed: _switchAutMod,
                      child: Text(
                        _authMode == AuthMode.Login ? 'Registrar' : 'Login',
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

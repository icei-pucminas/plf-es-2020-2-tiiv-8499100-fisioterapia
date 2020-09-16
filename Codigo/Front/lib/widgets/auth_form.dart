import 'package:flutter/material.dart';
import 'package:projeto_fisio/models/auth_data.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthData authData) onSubmit;
  final void Function(int) mudarPagina;

  AuthForm(this.onSubmit, this.mudarPagina);

  @override
  _AuthFormState createState() => _AuthFormState();
}

//enum SingingCharacter { fisioterapeuta, voluntario }

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthData _authData = AuthData();
// SingingCharacter _character = SingingCharacter.fisioterapeuta;

  _submit() {
    bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      widget.onSubmit(_authData);
      widget.mudarPagina(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  if (_authData.isSignup)
                    TextFormField(
                      key: ValueKey('name'),
                      initialValue: _authData.name,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      onChanged: (value) => _authData.name = value,
                      validator: (value) {
                        if (value == null || value.trim().length < 4) {
                          return 'Nome deve conter no mínimo 4 caracteres.';
                        }
                        return null;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    onChanged: (value) => _authData.email = value,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Forneça um e-mail válido.';
                      }
                      if (value == null || !value.contains('.com')) {
                        return 'Forneça um e-mail válido.';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    onChanged: (value) => _authData.password = value,
                    validator: (value) {
                      if (value == null || value.trim().length < 8) {
                        return 'Senha deve conter no mínimo 8 caracteres.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1),
                  RaisedButton(
                    child: Text(_authData.isLogin ? 'Entrar' : 'Cadastrar'),
                    onPressed: _submit,
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      _authData.isLogin
                          ? 'Criar uma nova conta ?'
                          : 'Entrar com conta já cadastrada',
                    ),
                    onPressed: () {
                      setState(() {
                        _authData.toggleMode();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

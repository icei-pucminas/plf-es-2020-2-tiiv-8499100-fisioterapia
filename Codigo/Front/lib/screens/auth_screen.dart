import 'package:projeto_fisio/models/auth_data.dart';
import 'package:projeto_fisio/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final void Function(int) mudarPagina;
  AuthScreen(this.mudarPagina);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _handleSubmit(AuthData authData) {
    print(authData.name);
    print(authData.email);
    print(authData.password);
    //print(authData.fisioterapeuta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_handleSubmit, widget.mudarPagina),
    );
  }
}

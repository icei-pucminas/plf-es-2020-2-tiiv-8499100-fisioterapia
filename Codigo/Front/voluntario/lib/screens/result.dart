import 'package:flutter/material.dart';
import 'package:projeto_fisio/models/model_voluntary.dart';
// ignore: unused_import
import 'auth_voluntary.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Model model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Dados do Atleta:')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome:', style: TextStyle(fontSize: 22)),
            Text(model.firstName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Sobrenome:', style: TextStyle(fontSize: 22)),
            Text(model.lastName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Email:', style: TextStyle(fontSize: 22)),
            Text(model.email, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Idade:', style: TextStyle(fontSize: 22)),
            Text(model.idade, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Lado Dominante:', style: TextStyle(fontSize: 22)),
            Text(model.sideDominant, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Número:', style: TextStyle(fontSize: 22)),
            Text(model.number, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Posição:', style: TextStyle(fontSize: 22)),
            Text(model.position, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Altura:', style: TextStyle(fontSize: 22)),
            Text(model.height, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Peso:', style: TextStyle(fontSize: 22)),
            Text(model.weight, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Celular:', style: TextStyle(fontSize: 22)),
            Text(model.cellphone, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Profissão:', style: TextStyle(fontSize: 22)),
            Text(model.profession, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    ));
  }
}

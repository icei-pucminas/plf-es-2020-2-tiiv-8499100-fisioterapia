import 'package:flutter/material.dart';
//import 'package:projeto_fisio/models/auth_dataForm.dart';

class FormScreen extends StatelessWidget {
  //final AuthDataV _authDataV = AuthDataV();

  _submitV() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Form(
              child: Column(
                children: <Widget>[
                  Text('Dados de Voluntário'),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome :',
                    ),
                    // onChanged: (value) => _authDataV.name = value,
                    validator: (value) {
                      if (value == null || value.trim().length < 4) {
                        return 'Nome deve conter no mínimo 4 caracteres.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Idade :',
                    ),
                    // onChanged: (value) => _authDataV.idade = value,
                    validator: (value) {
                      if (value == null || value.trim().length > 2) {
                        return 'Favor digitar idade novamente!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Lado Dominante :',
                    ),
                    //   onChanged: (value) => _authDataV.ladoDominante = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Número :',
                    ),
                    //  onChanged: (value) => _authDataV.numero = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Posição :',
                    ),
                    //  onChanged: (value) => _authDataV.posicao = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Peso :',
                    ),
                    //  onChanged: (value) => _authDataV.peso = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Altura :',
                    ),
                    //   onChanged: (value) => _authDataV.altura = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail :',
                    ),
                    //  onChanged: (value) => _authDataV.email = value,
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
                    decoration: InputDecoration(
                      labelText: 'Celular :',
                    ),
                    //   onChanged: (value) => _authDataV.celular = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Profissão :',
                    ),
                    //   onChanged: (value) => _authDataV.profissao = value,
                  ),
                  RaisedButton(
                    child: Text('Salvar'),
                    onPressed: _submitV,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

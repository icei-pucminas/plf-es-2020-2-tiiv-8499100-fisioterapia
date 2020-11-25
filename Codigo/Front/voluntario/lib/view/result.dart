import 'package:flutter/material.dart';
import 'package:projeto_fisio/provider/model_voluntarys.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool _isLoading = true;
  final tamanhoValor = 18.0;
  final tamanhoVariavel = 20.0;

  @override
  Widget build(BuildContext context) {
    Model model = Provider.of<ModelsVoluntarys>(context).voluntarys.last;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados do Atleta:'),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child:
              /* _isLoading
              ? CircularProgressIndicator()
              : */
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListTile(
                title:
                    Text('Nome:', style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.firstName,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Sobrenome:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.lastName,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title:
                    Text('Email:', style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle:
                    Text(model.email, style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title:
                    Text('Idade:', style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle:
                    Text(model.idade, style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Lado Dominante:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.sideDominant,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Número:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.number.toString(),
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Posição:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.position,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Altura:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.height.toString(),
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title:
                    Text('Peso:', style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.weight.toString(),
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Celular:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.cellphone,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(height: 5),
              ListTile(
                title: Text('Profissão:',
                    style: TextStyle(fontSize: tamanhoVariavel)),
                subtitle: Text(model.profession,
                    style: TextStyle(fontSize: tamanhoValor)),
                dense: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.teal[600],
                child: Text(
                  'Voltar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Navigator.of(context)
                    .popAndPushNamed(AppRoutes.AUX_HOME_SCREEN),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

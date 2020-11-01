import 'package:FisioAux/provider/model_voluntarys.dart';
import 'package:FisioAux/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class VoluntaryForm extends StatefulWidget {
  @override
  _VoluntaryFormState createState() => _VoluntaryFormState();
}

class _VoluntaryFormState extends State<VoluntaryForm> {
  //final _formkey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final sobreNomeController = TextEditingController();
  final emailController = TextEditingController();
  final idadeController = TextEditingController();
  final sideDominantController = TextEditingController();
  final numberController = TextEditingController();
  final positionController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final cellphoneController = TextEditingController();
  final professionController = TextEditingController();

  //Model model = Model();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 40,
          ),
          child: Form(
            //      key: _formkey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: nomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite seu nome';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: sobreNomeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Sobrenome",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite seu sobrenome';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Digite um email válido';
                    }
                    //            _formkey.currentState.save();
                    return null;
                  },
                ),
                TextFormField(
                  controller: sideDominantController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Lado Dominante",
                    labelStyle: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Digite o lado dominante';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: positionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Posição",
                    labelStyle: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Digite a posição';
                    }
                    //          _formkey.currentState.save();
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: idadeController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Idade",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua idade';
                          }
                          //              _formkey.currentState.save();
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: professionController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Profissão",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua profissão';
                          }
                          //            _formkey.currentState.save();
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: heightController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Altura",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua altura';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Peso",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite o seu peso';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: cellphoneController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Celular",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Informe  o seu celular';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Número",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite o seu numeo';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => {
                    Provider.of<ModelsVoluntarys>(context, listen: false)
                        .enviarVoluntarios(new Model(
                      firstName: nomeController.text,
                      lastName: sobreNomeController.text,
                      email: emailController.text,
                      idade: idadeController.text,
                      sideDominant: sideDominantController.text,
                      number: numberController.text,
                      position: positionController.text,
                      weight: weightController.text,
                      height: heightController.text,
                      cellphone: cellphoneController.text,
                      profession: professionController.text,
                    )),
                    print('entra'),
                    Navigator.of(context)
                        .pushNamed(AppRoutes.RESULT_AUTH_VOLUNTARY),
                  },
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_fisio/models/model_voluntary.dart';
import 'package:projeto_fisio/screens/result.dart';
import 'package:validators/validators.dart' as validator;
import 'result.dart';

class VoluntaryForm extends StatefulWidget {
  final void Function(int) mudarPagina;
  VoluntaryForm(this.mudarPagina);

  @override
  _VoluntaryFormState createState() => _VoluntaryFormState();
}

class _VoluntaryFormState extends State<VoluntaryForm> {
  final _formkey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Nome:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite seu nome';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.firstName = value;
                        }),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Sobrenome:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite seu sobrenome';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.lastName = value;
                        }),
                  ),
                ],
              ),
              MyTextFormFild(
                hintText: 'E-mail:',
                isEmail: true,
                validator: (String value) {
                  if (!validator.isEmail(value)) {
                    return 'Digite um email válido';
                  }
                  _formkey.currentState.save();
                  return null;
                },
                onSaved: (String value) {
                  model.email = value;
                },
              ),
              MyTextFormFild(
                  hintText: 'Lado Dominante:',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Digite o lado dominante';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.sideDominant = value;
                  }),
              MyTextFormFild(
                  hintText: 'Posição:',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Digite a posicao';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.position = value;
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Idade:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua idade';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.idade = value;
                        }),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Profissão:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua profissao';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.profession = value;
                        }),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Altura:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua altura';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.height = value;
                        }),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Peso:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua altura';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.weight = value;
                        }),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Celular:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua altura';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.cellphone = value;
                        }),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormFild(
                        hintText: 'Número:',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Digite sua altura';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.number = value;
                        }),
                  ),
                ],
              ),
              MyTextFormFild(
                hintText: 'Data de Conclusão:',
              ),
              RaisedButton(
                color: Colors.grey,
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  model: this.model,
                                )));
                  }
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
                onPressed: () => widget.mudarPagina(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFormFild extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isEmail;

  MyTextFormFild({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(3.0),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

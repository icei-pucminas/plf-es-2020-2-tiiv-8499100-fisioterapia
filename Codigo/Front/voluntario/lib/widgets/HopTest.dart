import 'package:flutter/material.dart';
import 'package:projeto_fisio/provider/auxFichas.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

class HopTest extends StatefulWidget {
  final int idExame;
  final int idTeste;

  HopTest(this.idExame, this.idTeste);
  @override
  _HopTest createState() => _HopTest();
}

class _HopTest extends State<HopTest> {
  String infoText = "Distância em metros";
  //String infoText1 = "Membro Esquerdo";
  TextEditingController membroDireito = TextEditingController();
  // TextEditingController membroEsquerdo = TextEditingController();
  var verificarTeste = true;
  TestePendente teste;

  Widget buildTextfield(String label, TextEditingController controll) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      keyboardType: TextInputType.number,
      controller: controll,
    );
  }

  void _concatenarCampos() {
    FichasAux fichasAux = Provider.of<FichasAux>(context, listen: false);
    setState(() {
      infoText = "Distância em metros ${membroDireito.text}";
      // infoText1 = "Quantidade de toques realziados ME ${membroEsquerdo.text}";

      teste = fichasAux.inserirRespostaTesteDoisValores(
        widget.idExame,
        widget.idTeste,
        membroDireito.text,
        'Não preenchido',
        infoText,
        'Não preenchido',
      );
      verificarTeste = false;
    });
  }

  void _resetField() {
    setState(() {
      membroDireito.text = "";
      //membroEsquerdo.text = "";
      infoText = "Ditância em metros";
      // infoText1 = "Distância do membro Esquerdo";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text("HT Teste"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetField();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildTextfield("Distância em metros:", membroDireito),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            /*buildTextfield("Membro Esquerdo:", membroEsquerdo),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText1,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40.0,
                    child: verificarTeste
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.teal[700],
                            child: Text(
                              "Verificar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                _concatenarCampos();
                              });
                            },
                          )
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.teal[700],
                            child: Text(
                              "Enviar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                Provider.of<FichasAux>(context, listen: false)
                                    .enviarExerciciosRespondidos(teste)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                          ),
                  ),
                ),
                /*SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.teal[700],
                      child: Text(
                        "  Voltar  ",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () => Navigator.of(context)
                          .popAndPushNamed(AppRoutes.AUX_HOME_SCREEN),
                    ),
                  ),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_fisio/provider/auxFichas.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

class CalcStar extends StatefulWidget {
  final int idExame;
  final int idTeste;
  CalcStar(this.idExame, this.idTeste);
  @override
  _CalcStarState createState() => _CalcStarState();
}

class _CalcStarState extends State<CalcStar> {
  String infoText = "";
  String infoText1 = "";
  String infoText2 = "";
  String infoText3 = "";
  String infoText4 = "Resultado Membro Direito ";
  String infoText5 = "Resultado Membro Esquerdo ";

  TextEditingController membroDireito = TextEditingController();
  TextEditingController membroEsquerdo = TextEditingController();
  TextEditingController direcaoAnteriorD = TextEditingController();
  TextEditingController direcaoAnteriorE = TextEditingController();
  TextEditingController posteroLateral = TextEditingController();
  TextEditingController posteroLateralE = TextEditingController();
  TextEditingController posteroMedial = TextEditingController();
  TextEditingController posteroMedialE = TextEditingController();
  TextEditingController mostrarResultado = TextEditingController();
  TextEditingController mostrarResultadoE = TextEditingController();

  TestePendente teste;
  var verificarTeste = true;

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

  void _resetField() {
    setState(() {
      membroDireito.text = "";
      membroEsquerdo.text = "";
      direcaoAnteriorD.text = "";
      direcaoAnteriorE.text = "";
      posteroLateral.text = "";
      posteroLateralE.text = "";
      posteroMedial.text = "";
      posteroMedialE.text = "";
      infoText4 = "Resultado Membro Direito  ";
      infoText5 = "Resultado Membro Esquerdo ";
    });
  }

  void _calculate() {
    FichasAux fichasAux = Provider.of<FichasAux>(context, listen: false);
    int mDireito = int.parse(membroDireito.text);
    int mEsquerdo = int.parse(membroEsquerdo.text);
    int anterior = int.parse(direcaoAnteriorD.text);
    int anteriorE = int.parse(direcaoAnteriorE.text);
    int pLateral = int.parse(posteroLateral.text);
    int pLateralE = int.parse(posteroLateralE.text);
    int pMedial = int.parse(posteroMedial.text);
    int pMedialE = int.parse(posteroMedialE.text);

    int resultadoD = (anterior + pLateral + pMedial) * (3 * mDireito);
    int resultadoE = (anteriorE + pLateralE + pMedialE) * (3 * mEsquerdo);

    setState(() {
      infoText4 = "Resultado Lado Direito:  " + ("$resultadoD");
      infoText5 = "Resultado Lado Esquerdo: " + ("$resultadoE");
      teste = fichasAux.inserirRespostaTesteOitoValores(
        widget.idExame,
        widget.idTeste,
        membroDireito.text,
        membroEsquerdo.text,
        direcaoAnteriorD.text,
        direcaoAnteriorE.text,
        posteroLateral.text,
        posteroLateralE.text,
        posteroMedial.text,
        posteroMedialE.text,
        infoText4,
        infoText5,
      );
      verificarTeste = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text("Star Excursion Balance Test"),
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
            //Comprimento Membro Direito
            buildTextfield("Comprimento do Membro Direito:", membroDireito),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
            ),
            //Comprimento Membro Esquerdo
            buildTextfield("Comprimento do Membro Esquerdo:", membroEsquerdo),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            //Direcao Anterior Direito
            buildTextfield("Direção Anterior Direita:", direcaoAnteriorD),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText1,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            //Direcao Anterior Esquerdo
            buildTextfield("Direção Anterior Esquerdo:", direcaoAnteriorE),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText1,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            //Postero Lateral Direito
            buildTextfield("Direção Postero Lateral Direito:", posteroLateral),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText2,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            //Postero Lateral Esquerdo
            buildTextfield(
                "Direção Postero Lateral Esquerdo:", posteroLateralE),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText2,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            //Postero Medial Direito
            buildTextfield("Direção Postero Medial Direito:", posteroMedial),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText3,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            //Postero Medial Esquerdo
            buildTextfield("Direção Postero Medial Esquerdo:", posteroMedialE),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText3,
                style: TextStyle(color: Colors.black, fontSize: 10.0),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            //resultado Direito
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                infoText4,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            //resultado Esquerdo
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                infoText5,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
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
                                _calculate();
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
                                    .enviarExerciciosRespondidos(teste);
                              });
                            },
                          ),
                  ),
                ),
                //botão de voltar
                SizedBox(width: 20),
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
                        "Voltar",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () => Navigator.of(context)
                          .popAndPushNamed(AppRoutes.AUX_HOME_SCREEN),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

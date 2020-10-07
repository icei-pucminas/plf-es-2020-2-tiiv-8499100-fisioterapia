import 'package:flutter/material.dart';

class CalcStar extends StatefulWidget {
  final void Function(int) mudarPagina;
  CalcStar(this.mudarPagina);
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

  Widget buildTextfield(String label, TextEditingController controll) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.black, fontSize: 2.0),
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
      infoText4 = "Resultado Membro Direito:  " + ("$resultadoD");
      infoText5 = "Resultado Membro Esquerdo: " + ("$resultadoE");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
            //botão verificar
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40.0,
                child: RaisedButton(
                  child: Text(
                    "Verificar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    _calculate();
                  },
                ),
              ),
            ),
            //botão de voltar
            // Row(
            // children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40.0,
                child: RaisedButton(
                  child: Text(
                    "Voltar",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () => widget.mudarPagina(1),
                ),
              ),
            ),
            // ],
            //),
          ],
        ),
      ),
    );
  }
}

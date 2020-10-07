import 'package:flutter/material.dart';

class CalcRQ extends StatefulWidget {
  final void Function(int) mudarPagina;
  CalcRQ(this.mudarPagina);
  @override
  _CalcRQState createState() => _CalcRQState();
}

class _CalcRQState extends State<CalcRQ> {
  String infoText = "Grau de Rigidez";
  String infoText1 = "Grau de Rigidez";
  TextEditingController membroDireito = TextEditingController();
  TextEditingController membroEsquerdo = TextEditingController();

  Widget buildTextfield(String label, TextEditingController controll) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: controll,
    );
  }

  void _resetField() {
    setState(() {
      membroDireito.text = "";
      membroEsquerdo.text = "";
      infoText = "Grau de Rigidez";
      infoText1 = "Grau de Rigidez";
    });
  }

  void _calculate() {
    int mDireito = int.parse(membroDireito.text);
    int mEsquerdo = int.parse(membroEsquerdo.text);

    setState(() {
      if (mDireito < 30) {
        infoText = "Alta Rigidez";
      } else if (mDireito > 40) {
        infoText = "Baixa Rigidez";
      }
      if (mEsquerdo < 30) {
        infoText1 = "Alta Rigidez";
      } else if (mEsquerdo > 40) {
        infoText1 = "Baixa Rigidez";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Rigidez de RQ"),
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
            buildTextfield("Membro Direito:", membroDireito),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            buildTextfield("Membro Esquerdo:", membroEsquerdo),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                infoText1,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40.0,
                child: RaisedButton(
                  child: Text(
                    "Verificar",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    _calculate();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40.0,
                child: RaisedButton(
                  child: Text(
                    "  Voltar  ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () => widget.mudarPagina(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  final void Function(int) mudarPagina;

  Cadastro(
    this.mudarPagina,
  );
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var opcEscolhida;

  Container retornarParaLogin() {
    return Container(
      color: Colors.grey[100],
      alignment: Alignment.center,
      child: FlatButton(
        child: Text(
          'Retornar para tela de login',
          style: TextStyle(
            color: Colors.grey[450],
          ),
        ),
        onPressed: () => widget.mudarPagina(0),
      ),
      //Text('Voltar para o login'),
    );
  }

  Container finalizarCadastro() {
    return Container(
      child: FlatButton(
          onPressed: () {},
          color: Colors.teal[600],
          child: Text(
            "Enviar",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget campoAdicional(String tipoUsuario) {
    if (tipoUsuario == 'a') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            alignment: Alignment.center,
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Código do fisioterapeuta",
                labelStyle: TextStyle(
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          retornarParaLogin(),
          SizedBox(
            height: 10,
          ),
          finalizarCadastro(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          retornarParaLogin(),
          SizedBox(
            height: 10,
          ),
          finalizarCadastro(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Container(
        color: Colors.grey[100],
        margin: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        /*margin: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        */
        child: ListView(
          children: <Widget>[
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[600],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 300,
              alignment: Alignment.center,
              //color: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[300],
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirme a Senha",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                  onPressed: () {},
                  color: Colors.teal[600],
                  child: Text(
                    "Enviar",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[100],
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  'Retornar para tela de login',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                onPressed: () => widget.mudarPagina(0),
              ),
              //Text('Voltar para o login'),
            ),
          ],
        ),
      ),
    );
  }
}

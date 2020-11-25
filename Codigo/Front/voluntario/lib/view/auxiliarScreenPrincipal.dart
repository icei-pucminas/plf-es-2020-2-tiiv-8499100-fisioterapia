import 'package:flutter/material.dart';
import 'package:projeto_fisio/provider/auth.dart';
import 'package:projeto_fisio/provider/auxFichas.dart';
import 'package:projeto_fisio/provider/contaDoUsuario.dart';

import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:projeto_fisio/widgets/ClosedKinect.dart';
import 'package:projeto_fisio/widgets/Dirsoflexao.dart';
import 'package:projeto_fisio/widgets/HopTest.dart';
import 'package:projeto_fisio/widgets/SingleLeg.dart';
import 'package:projeto_fisio/widgets/calc_Rq.dart';
import 'package:projeto_fisio/widgets/calc_Star.dart';
import 'package:projeto_fisio/widgets/calc_Y.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  bool _isSelect = false;
  TextEditingController codigo = TextEditingController();
  //List<FichaAux> lista = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<FichasAux>(context, listen: false)
        .receberSolicitacao()
        .then((_) {
      setState(() {
        //  log('depois');
        //      lista = value;
        _isLoading = false;
      });
    });
  }

  void realizarTeste(String nomeInserido, int idExame, int idTeste) {
    switch (nomeInserido) {
      case 'Calc Star':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcStar(idExame, idTeste);
            },
          ),
        );

        break;
      case 'Calc RQ':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcRQ(idExame, idTeste);
            },
          ),
        );
        break;
      case 'Calc Y':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcY(idExame, idTeste);
            },
          ),
        );

        break;
      case 'Hop Teste':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HopTest(idExame, idTeste);
            },
          ),
        );
        break;
      case 'Closed Kinect':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClosedKinect(idExame, idTeste);
            },
          ),
        );
        break;
      case 'Dirso Flexão':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Dirsoflexao(idExame, idTeste);
            },
          ),
        );
        break;
      case 'Single Leg':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SingleLeg(idExame, idTeste);
            },
          ),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    ContaUsuario user = Provider.of<ContaUsuario>(context);

    FichasAux fichas = Provider.of<FichasAux>(context);
    Auth sairConta = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('FisioApp'),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: <Color>[Colors.white, Colors.grey]),
              ),
              child: Text('Menu Principal'),
            ),
            _isSelect
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: codigo,
                        decoration: InputDecoration(
                          labelText: "Insira o codigo",
                          labelStyle: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe um codigo válido ! ';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            user.vincComFisio(codigo.text);
                            _isSelect = !_isSelect;
                          });
                        },
                        child: Text(
                          'Vincular',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.teal[600],
                      ),
                    ],
                  )
                : FlatButton(
                    onPressed: () {
                      setState(() {
                        _isSelect = !_isSelect;
                      });
                    },
                    child: Text(
                      'Vinculação',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.teal[600],
                  ),
            CustomTile(
              Icons.account_circle,
              'Cadastrar Atleta',
              () => Navigator.of(context).pushNamed(
                AppRoutes.CARD_PEDIDO_ATLETA,
              ),
            ),
            CustomTile(
              Icons.arrow_back,
              'Sair',
              () => sairConta.logout(context),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          right: 40,
          left: 40,
        ),
        child: _isLoading
            ? CircularProgressIndicator()
            : fichas.listaPedido.isEmpty
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text('Lista vazia'),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: fichas.listaPedido.length,
                    itemBuilder: (ctx, index) {
                      final exa = fichas.listaPedido[index];
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.teal[800], width: 3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              shadowColor: Colors.teal[700],
                              elevation: 2,
                              child: Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Fisioterapeuta : ${exa.nomeFisioterapeuta}',
                                          style: TextStyle(
                                            color: Colors.teal[600],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Atleta : ${exa.nomeAtleta}',
                                          style: TextStyle(
                                            color: Colors.teal[600],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: Center(
                                        child: Text(
                                          'Testes',
                                          style: TextStyle(
                                            color: Colors.teal[600],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      children: <Widget>[
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: exa.testes.length,
                                          itemBuilder: (ctx, index) {
                                            final teste = exa.testes[index];
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 20,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.teal[700],
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: teste.verificarTeste()
                                                  ? FlatButton(
                                                      textColor:
                                                          Colors.teal[600],
                                                      onPressed: () {
                                                        setState(() {
                                                          realizarTeste(
                                                              teste.nome,
                                                              teste.idExame,
                                                              teste.idTeste);
                                                        });
                                                      },
                                                      child: Text(
                                                          teste.nomeLayout),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            ' ${teste.nomeLayout} ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .teal[700],
                                                            ),
                                                          ),
                                                          Text(
                                                            ' (Realizado) ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .teal[700],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    },
                  ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Text(text, style: TextStyle(fontSize: 16.0)),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

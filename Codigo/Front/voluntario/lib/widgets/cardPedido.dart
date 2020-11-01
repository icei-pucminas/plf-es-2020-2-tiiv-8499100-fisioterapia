import 'package:FisioAux/provider/auxFichas.dart';
import 'package:FisioAux/utils/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPedido extends StatefulWidget {
  @override
  _CardPedidoState createState() => _CardPedidoState();
}

class _CardPedidoState extends State<CardPedido> {
  @override
  Widget build(BuildContext context) {
    List<FichaAux> lista = Provider.of<FichasAux>(context).listaTeste;
    return Container(
      height: 500,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: lista.isEmpty
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
              itemCount: lista.length,
              itemBuilder: (ctx, index) {
                final exa = lista[index];
                return Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        color: Colors.teal[50],
                        shadowColor: Colors.teal[700],
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal[700],
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Fisioterapeuta : ${exa.nomeFisio}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Atleta : ${exa.nomeAtleta}'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              Container(
                                height: 150,
                                child: ListView.builder(
                                  itemCount: exa.testes.length,
                                  itemBuilder: (ctx, index) {
                                    final teste = exa.testes[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        teste.nome.contains('Rigidez de RQ')
                                            ? FlatButton(
                                                textColor: Colors.teal[600],
                                                onPressed: () {
                                                  setState(() {
                                                    teste.pendente = true;
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            AppRoutes.CALC_RQ);
                                                  });
                                                },
                                                child: Text('${teste.nome}'),
                                              )
                                            : teste.nome.contains('Y Test')
                                                ? FlatButton(
                                                    textColor: Colors.teal[600],
                                                    onPressed: () {
                                                      setState(() {
                                                        teste.pendente = true;
                                                        Navigator.of(context)
                                                            .pushNamed(AppRoutes
                                                                .CALC_Y);
                                                      });
                                                    },
                                                    child:
                                                        Text('${teste.nome}'),
                                                  )
                                                : FlatButton(
                                                    textColor: Colors.teal[600],
                                                    onPressed: () {
                                                      setState(() {
                                                        teste.pendente = true;
                                                        Navigator.of(context)
                                                            .pushNamed(AppRoutes
                                                                .CALC_STAR);
                                                      });
                                                    },
                                                    child:
                                                        Text('${teste.nome}'),
                                                  ),
                                        Text(teste.pendente
                                            ? 'Realizado'
                                            : 'Pendente'),
                                      ],
                                    );
                                  },
                                ),
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
    );
  }
}

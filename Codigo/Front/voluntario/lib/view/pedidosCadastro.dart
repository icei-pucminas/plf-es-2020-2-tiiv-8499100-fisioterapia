import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_fisio/provider/model_voluntarys.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PedidoCadastro extends StatefulWidget {
  PedidoCadastro();
  @override
  _PedidoCadastroState createState() => _PedidoCadastroState();
}

class _PedidoCadastroState extends State<PedidoCadastro> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ModelsVoluntarys>(context, listen: false)
        .receberPedido()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ModelsVoluntarys pedidosAtletas = Provider.of<ModelsVoluntarys>(context);
    List<PedidoCadastroCard> lista = pedidosAtletas.pedidosCarregados;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text(
          'Cadastro de Atletas',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: _isLoading
          ? CircularProgressIndicator()
          : Container(
              height: 500,
              padding: EdgeInsets.only(
                top: 60,
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
                        final pedAtl = lista[index];
                        return Column(
                          children: <Widget>[
                            Container(
                              child: Card(
                                shadowColor: Colors.teal[700],
                                elevation: 2,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 30,
                                  ),
                                  width: 220,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.teal[700],
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                                'Fisioterapeuta : ${pedAtl.nomeFisio}'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Atleta : ${pedAtl.nomeAtl}'),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: FlatButton(
                                          onPressed: () => Navigator.of(context)
                                              .pushNamed(
                                                  AppRoutes.AUTH_VOLUNTARY),
                                          child: Text(
                                            'Cadastrar',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.teal[600],
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
            ),
    );
  }
}

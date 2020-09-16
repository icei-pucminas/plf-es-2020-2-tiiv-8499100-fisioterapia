import 'package:flutter/material.dart';

class Auxiliares extends StatelessWidget {
  final void Function(int) mudarPagina;
  Auxiliares(
    this.mudarPagina,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('exame1'),
          ),
          Container(
            child: Text('exame2'),
          ),
        ],
      ),
    );
  }
}

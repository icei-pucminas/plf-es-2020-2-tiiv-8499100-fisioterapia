import 'package:FisioAux/acessoConta/login.dart';
import 'package:FisioAux/provider/auth.dart';
import 'package:FisioAux/provider/auxFichas.dart';
import 'package:FisioAux/provider/model_voluntarys.dart';
import 'package:FisioAux/utils/app_routes.dart';
import 'package:FisioAux/view/auth_Ou_Fichas.dart';
import 'package:FisioAux/view/auxiliarScreenPrincipal.dart';
import 'package:FisioAux/view/result.dart';
import 'package:FisioAux/widgets/calc_Rq.dart';
import 'package:FisioAux/widgets/calc_Star.dart';
import 'package:FisioAux/widgets/calc_Y.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/auth_voluntary.dart';

void main() {
  runApp(FisioApp());
}

class FisioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProvider<ModelsVoluntarys>(
          create: (_) => new ModelsVoluntarys(),
        ),
        ChangeNotifierProvider<FichasAux>(
          create: (_) => new FichasAux(),
        ),
      ],
      child: MaterialApp(
        //home: MyHomePage(),
        routes: {
          AppRoutes.AUTHOUFICHAS: (ctx) => AuthOuFicha(),
          AppRoutes.LOGIN: (ctx) => Login(),
          AppRoutes.AUX_HOME_SCREEN: (ctx) => HomeScreen(),
          AppRoutes.AUTH_VOLUNTARY: (ctx) => VoluntaryForm(),
          AppRoutes.RESULT_AUTH_VOLUNTARY: (ctx) => Result(),
          AppRoutes.CALC_RQ: (ctx) => CalcRQ(),
          AppRoutes.CALC_Y: (ctx) => CalcY(),
          AppRoutes.CALC_STAR: (ctx) => CalcStar(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Login()),
    );
  }
}

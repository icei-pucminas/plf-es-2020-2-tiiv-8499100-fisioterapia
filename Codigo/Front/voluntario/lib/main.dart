import 'package:flutter/material.dart';
import 'package:projeto_fisio/acessoConta/login.dart';
import 'package:projeto_fisio/provider/auth.dart';
import 'package:projeto_fisio/provider/auxFichas.dart';
import 'package:projeto_fisio/provider/contaDoUsuario.dart';
import 'package:projeto_fisio/provider/model_voluntarys.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:projeto_fisio/view/auth_Ou_Fichas.dart';
import 'package:projeto_fisio/view/auxiliarScreenPrincipal.dart';
import 'package:projeto_fisio/view/pedidosCadastro.dart';
import 'package:projeto_fisio/view/result.dart';
import 'package:provider/provider.dart';

import 'screens/auth_voluntary.dart';

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
        ChangeNotifierProxyProvider<Auth, ContaUsuario>(
          create: (_) => new ContaUsuario(null, null),
          update: (ctx, auth, previous) => new ContaUsuario(
            auth.token,
            auth.userId,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, FichasAux>(
          create: (_) => new FichasAux(null, null),
          update: (ctx, auth, previous) => new FichasAux(
            auth.token,
            auth.userId,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, ModelsVoluntarys>(
          create: (_) => new ModelsVoluntarys(null, null),
          update: (ctx, auth, previous) => new ModelsVoluntarys(
            auth.token,
            auth.userId,
          ),
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
          AppRoutes.CARD_PEDIDO_ATLETA: (ctx) => PedidoCadastro(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

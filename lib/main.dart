import 'package:flutter/material.dart';
import 'package:zakazpro/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/choose_account',
      onGenerateRoute: (settings) => RouteGenerator.routes(settings: settings),
    );
  }
}

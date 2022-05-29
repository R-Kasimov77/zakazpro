import 'package:flutter/material.dart';
import 'package:zakazpro/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/login',
      onGenerateRoute: (settings) => RouteGenerator.routes(settings: settings),
    );
  }
}

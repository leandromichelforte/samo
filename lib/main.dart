import 'package:flutter/material.dart';
import 'package:samo/core/routes/named_routes.dart';
import 'package:samo/core/routes/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.allRoutes(context),
      initialRoute: NamedRoutes.waterJugPage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samo/core/injections/injections.dart';
import 'package:samo/core/routes/named_routes.dart';
import 'package:samo/core/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WaterJugInject.inject();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Jug',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      routes: Routes.allRoutes(context),
      initialRoute: NamedRoutes.waterJugPage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo/core/routes/named_routes.dart';
import 'package:samo/features/water_jug/presenter/cubits/cubits.dart';
import 'package:samo/features/water_jug/presenter/pages/pages.dart';

sealed class Routes {
  static Map<String, Widget Function(BuildContext)> allRoutes(
    BuildContext context,
  ) =>
      {
        NamedRoutes.waterJugPage: (context) => BlocProvider<WaterJugCubit>(
              create: (context) => WaterJugCubit(),
              child: const WaterJugPage(),
            ),
      };
}

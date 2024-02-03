import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo/core/injections/instances/get_it/get_it_instance.dart';
import 'package:samo/core/routes/named_routes.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';
import 'package:samo/features/water_jug/presenter/cubits/cubits.dart';
import 'package:samo/features/water_jug/presenter/pages/pages.dart';

sealed class Routes {
  static Map<String, Widget Function(BuildContext)> allRoutes(
    BuildContext context,
  ) =>
      {
        NamedRoutes.waterJugPage: (context) => BlocProvider<WaterJugCubit>(
              create: (context) => WaterJugCubit(
                validateValuesUsecase: getIt.get<ValidateValuesUsecase>(),
                getAllScenariosUsecase: getIt.get<GetAllScenariosUsecase>(),
              ),
              child: const WaterJugPage(),
            ),
      };
}

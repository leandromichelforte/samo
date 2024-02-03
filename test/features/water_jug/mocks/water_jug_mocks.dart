// ignore_for_file: prefer_const_constructors

import 'package:samo/features/water_jug/domain/entities/entities.dart';

sealed class WaterJugMocks {
  static final AllScenariosEntity allScenariosEntity = AllScenariosEntity(
    bestScenarioStepList: [
      stepEntity,
    ],
    worstScenarioStepList: [
      stepEntity,
      stepEntity2,
    ],
  );
  static final AllScenariosEntity allScenariosEntityEqual = AllScenariosEntity(
    bestScenarioStepList: [
      stepEntity,
    ],
    worstScenarioStepList: [
      stepEntity,
      stepEntity2,
    ],
  );
  static final StepEntity stepEntity =
      StepEntity(jugOne: 2, jugTwo: 0, description: 'Fill Jug 1');

  static final stepEntityEqual =
      StepEntity(jugOne: 2, jugTwo: 0, description: 'Fill Jug 1');

  static final StepEntity stepEntity2 = StepEntity(
    jugOne: 0,
    jugTwo: 2,
    description: 'Transfer from Jug 1 to Jug 2',
  );
}

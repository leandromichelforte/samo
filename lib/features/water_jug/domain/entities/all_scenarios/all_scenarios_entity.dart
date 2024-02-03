import 'package:flutter/foundation.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';

base class AllScenariosEntity {
  const AllScenariosEntity({
    required this.bestScenarioStepList,
    required this.wrostScenarioStepList,
  });

  final List<StepEntity> bestScenarioStepList;
  final List<StepEntity> wrostScenarioStepList;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllScenariosEntity &&
          listEquals(bestScenarioStepList, other.bestScenarioStepList) &&
          listEquals(
            wrostScenarioStepList,
            other.wrostScenarioStepList,
          );

  @override
  int get hashCode =>
      Object.hashAll(bestScenarioStepList) ^
      Object.hashAll(wrostScenarioStepList);
}

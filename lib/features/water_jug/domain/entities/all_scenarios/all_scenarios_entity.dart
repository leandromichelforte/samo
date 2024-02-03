import 'package:flutter/foundation.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';

base class AllScenariosEntity {
  const AllScenariosEntity({
    required this.bestScenarioStepList,
    required this.worstScenarioStepList,
  });

  final List<StepEntity> bestScenarioStepList;
  final List<StepEntity> worstScenarioStepList;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllScenariosEntity &&
          listEquals(bestScenarioStepList, other.bestScenarioStepList) &&
          listEquals(
            worstScenarioStepList,
            other.worstScenarioStepList,
          );

  @override
  int get hashCode =>
      Object.hashAll(bestScenarioStepList) ^
      Object.hashAll(worstScenarioStepList);
}

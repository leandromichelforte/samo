import 'dart:math';

import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

final class GetAllScenariosUsecaseImpl implements GetAllScenariosUsecase {
  const GetAllScenariosUsecaseImpl({
    required GetStepListUsecase getStepListUsecase,
  }) : _getStepListUsecase = getStepListUsecase;

  final GetStepListUsecase _getStepListUsecase;

  @override
  AllScenariosEntity call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  }) {
    final List<StepEntity> stepListFirstScenario = _getStepListUsecase(
      jugOne: jugOne,
      jugTwo: jugTwo,
      wantedAmount: wantedAmount,
    );
    final List<StepEntity> stepListSecondScenario = _getStepListUsecase(
      jugOne: jugTwo,
      jugTwo: jugOne,
      wantedAmount: wantedAmount,
    );
    final Map<int, List<StepEntity>> scenarios = {
      stepListFirstScenario.length: stepListFirstScenario,
      stepListSecondScenario.length: stepListSecondScenario,
    };
    return AllScenariosEntity(
      bestScenarioStepList: scenarios[min(
        stepListFirstScenario.length,
        stepListSecondScenario.length,
      )]!,
      wrostScenarioStepList: scenarios[max(
        stepListFirstScenario.length,
        stepListSecondScenario.length,
      )]!,
    );
  }
}

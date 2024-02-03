import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

import '../../../mocks/water_jug_mocktail.dart';

void main() {
  group('Get All Scenarios Usecase Impl ||', () {
    late GetAllScenariosUsecaseImpl usecase;
    late MockGetStepListUsecase mockGetStepListUsecase;

    setUp(() {
      mockGetStepListUsecase = MockGetStepListUsecase();
      usecase = GetAllScenariosUsecaseImpl(
          getStepListUsecase: mockGetStepListUsecase);
    });

    test('should return all scenarios with step lists', () {
      const jugOne = 2;
      const jugTwo = 5;
      const wantedAmount = 4;
      final stepListFirstScenario = [
        const StepEntity(jugOne: 2, jugTwo: 0, description: 'Fill Jug 1'),
        const StepEntity(
            jugOne: 0, jugTwo: 2, description: 'Transfer from Jug 1 to Jug 2'),
        const StepEntity(jugOne: 2, jugTwo: 2, description: 'Fill Jug 1'),
        const StepEntity(
            jugOne: 0, jugTwo: 4, description: 'Transfer from Jug 1 to Jug 2'),
      ];
      when(() => mockGetStepListUsecase(
              jugOne: any(named: 'jugOne'),
              jugTwo: any(named: 'jugTwo'),
              wantedAmount: any(named: 'wantedAmount')))
          .thenReturn(stepListFirstScenario);

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(result.bestScenarioStepList, stepListFirstScenario);
    });
  });
}

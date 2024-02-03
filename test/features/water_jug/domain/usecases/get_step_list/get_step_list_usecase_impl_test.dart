import 'package:flutter_test/flutter_test.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

void main() {
  group('Get Step List Usecase Impl ||', () {
    test('should return the step list to achieve the desired amount', () {
      const usecase = GetStepListUsecaseImpl();
      const jugOne = 2;
      const jugTwo = 10;
      const wantedAmount = 4;
      final expectedStepsList = [
        const StepEntity(jugOne: 2, jugTwo: 0, description: 'Fill Jug 1'),
        const StepEntity(
            jugOne: 0, jugTwo: 2, description: 'Transfer from Jug 1 to Jug 2'),
        const StepEntity(jugOne: 2, jugTwo: 2, description: 'Fill Jug 1'),
        const StepEntity(
            jugOne: 0, jugTwo: 4, description: 'Transfer from Jug 1 to Jug 2'),
      ];

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(result, expectedStepsList);
    });
  });
}

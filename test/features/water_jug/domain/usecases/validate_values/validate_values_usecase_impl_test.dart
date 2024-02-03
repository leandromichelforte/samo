import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

import '../../../mocks/water_jug_mocktail.dart';

void main() {
  group('Validate Values Usecase Impl ||', () {
    late ValidateValuesUsecaseImpl usecase;
    late MockGCDUsecase mockGCDUsecase;

    setUp(() {
      mockGCDUsecase = MockGCDUsecase();
      usecase = ValidateValuesUsecaseImpl(gcdUsecase: mockGCDUsecase);
    });

    void mockGCD(int valueToReturn) {
      when(() => mockGCDUsecase(x: any(named: 'x'), y: any(named: 'y')))
          .thenReturn(valueToReturn);
    }

    test(
        'should return Left with error message all values must be greather than 0',
        () {
      const jugOne = 0;
      const jugTwo = 5;
      const wantedAmount = 4;
      mockGCD(1);

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(result, const Left('All values must be greather than 0'));
    });

    test(
        'should return Left with "No Solution" message when wanted amount is greater than maximum jug capacity',
        () {
      const jugOne = 4;
      const jugTwo = 3;
      const wantedAmount = 5;
      mockGCD(1);

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(
          result,
          const Left(
              'No Solution\nWanted Amount must be lower than the each jug values'));
    });

    test(
        'should return Left with "No Solution" message when wanted amount is not divisible by the GCD of jug capacities',
        () {
      const jugOne = 6;
      const jugTwo = 9;
      const wantedAmount = 4;
      mockGCD(3);

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(
          result,
          const Left(
              'No Solution\nGreat commom divisor between the jug values must be able to divide the wanted amount'));
    });

    test('should return Right with null when all conditions are met', () {
      const jugOne = 6;
      const jugTwo = 9;
      const wantedAmount = 3;
      mockGCD(3);

      final result = usecase(
        jugOne: jugOne,
        jugTwo: jugTwo,
        wantedAmount: wantedAmount,
      );

      expect(result, const Right(null));
    });
  });
}

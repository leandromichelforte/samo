import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

final class ValidateValuesUsecaseImpl implements ValidateValuesUsecase {
  const ValidateValuesUsecaseImpl({required GCDUsecase gcdUsecase})
      : _gcdUsecase = gcdUsecase;

  final GCDUsecase _gcdUsecase;

  @override
  Either<String, void> call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  }) {
    if (jugOne <= 0 || jugTwo <= 0 || wantedAmount <= 0) {
      return const Left('All values must be greather than 0');
    } else if (jugOne.isEven && jugTwo.isEven && wantedAmount.isOdd) {
      return const Left(
          'No solution\nAn odd number cannot be reached from two even numbers');
    } else if (wantedAmount > max(jugOne, jugTwo)) {
      return const Left(
        'No Solution\nWanted Amount must be lower than the each jug values',
      );
    } else if ((wantedAmount % _gcdUsecase(x: jugOne, y: jugTwo)) != 0) {
      return const Left(
        'No Solution\nGreat commom divisor between the jug values must be able to divide the wanted amount',
      );
    }
    return const Right(null);
  }
}

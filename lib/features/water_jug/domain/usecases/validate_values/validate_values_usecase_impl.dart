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
    if (jugOne <= 0 || jugTwo <= 0) {
      return const Left('Jug values has to be greather than 0');
    } else if (wantedAmount > max(jugOne, jugTwo)) {
      return const Left('No Solution');
    } else if ((wantedAmount % _gcdUsecase(x: jugOne, y: jugTwo)) != 0) {
      return const Left('No Solution');
    }
    return const Right(null);
  }
}

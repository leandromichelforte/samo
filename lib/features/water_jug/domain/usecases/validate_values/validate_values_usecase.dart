import 'package:dartz/dartz.dart';

abstract interface class ValidateValuesUsecase {
  Either<String, void> call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  });
}

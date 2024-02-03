import 'package:samo/features/water_jug/domain/entities/entities.dart';

abstract interface class GetStepListUsecase {
  List<StepEntity> call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  });
}

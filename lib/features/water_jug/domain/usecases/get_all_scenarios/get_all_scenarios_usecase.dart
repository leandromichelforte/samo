import 'package:samo/features/water_jug/domain/entities/entities.dart';

abstract interface class GetAllScenariosUsecase {
  AllScenariosEntity call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  });
}

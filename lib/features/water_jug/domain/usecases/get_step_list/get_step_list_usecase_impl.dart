import 'dart:math';
import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

final class GetStepListUsecaseImpl implements GetStepListUsecase {
  const GetStepListUsecaseImpl();

  @override
  List<StepEntity> call({
    required int jugOne,
    required int jugTwo,
    required int wantedAmount,
  }) {
    int from = jugOne;
    int to = 0;
    const String fillXDescription = 'Fill Jug 1';
    final List<StepEntity> stepsList = [
      StepEntity(
        jugOne: from,
        jugTwo: to,
        description: fillXDescription,
      )
    ];
    while (from != wantedAmount && to != wantedAmount) {
      int temp = min(from, jugTwo - to);
      to += temp;
      from -= temp;
      stepsList.add(
        StepEntity(
          jugOne: from,
          jugTwo: to,
          description: 'Transfer from Jug 1 to Jug 2',
        ),
      );

      if (from == wantedAmount || to == wantedAmount) {
        break;
      }

      if (from == 0) {
        from = jugOne;
        stepsList.add(
          StepEntity(
            jugOne: from,
            jugTwo: to,
            description: fillXDescription,
          ),
        );
      }

      if (to == jugTwo) {
        to = 0;
        stepsList.add(
          StepEntity(
            jugOne: from,
            jugTwo: to,
            description: 'Empty Jug 2',
          ),
        );
      }
    }
    return stepsList;
  }
}

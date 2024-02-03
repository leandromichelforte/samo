import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/presenter/cubits/cubits.dart';

import '../../../mocks/water_jug_mocktail.dart';

void main() {
  group('Water Jug Cubit ||', () {
    late WaterJugCubit cubit;
    late MockValidateValuesUsecase mockValidateValuesUsecase;
    late MockGetAllScenariosUsecase mockGetAllScenariosUsecase;

    setUp(() {
      mockValidateValuesUsecase = MockValidateValuesUsecase();
      mockGetAllScenariosUsecase = MockGetAllScenariosUsecase();
      cubit = WaterJugCubit(
        validateValuesUsecase: mockValidateValuesUsecase,
        getAllScenariosUsecase: mockGetAllScenariosUsecase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is WaterJugInitialState', () {
      expect(cubit.state, const WaterJugInitialState());
    });

    blocTest<WaterJugCubit, WaterJugState>(
      'emits [WaterJugSuccessState] when calculate is called successfully',
      build: () {
        when(
          () => mockValidateValuesUsecase(
            jugOne: any(named: 'jugOne'),
            jugTwo: any(named: 'jugTwo'),
            wantedAmount: any(named: 'wantedAmount'),
          ),
        ).thenAnswer((_) => const Right(null));
        when(
          () => mockGetAllScenariosUsecase(
            jugOne: any(named: 'jugOne'),
            jugTwo: any(named: 'jugTwo'),
            wantedAmount: any(named: 'wantedAmount'),
          ),
        ).thenReturn(const AllScenariosEntity(
          bestScenarioStepList: [],
          wrostScenarioStepList: [],
        ));
        return cubit;
      },
      act: (cubit) => cubit.getScenarios(),
      expect: () => [
        isA<WaterJugSuccessState>(),
      ],
    );

    blocTest<WaterJugCubit, WaterJugState>(
      'emits [WaterJugErrorState] when validateValuesUsecase returns an error',
      build: () {
        when(
          () => mockValidateValuesUsecase(
            jugOne: any(named: 'jugOne'),
            jugTwo: any(named: 'jugTwo'),
            wantedAmount: any(named: 'wantedAmount'),
          ),
        ).thenAnswer((_) => const Left('Jug values has to be greater than 0'));
        return cubit;
      },
      act: (cubit) => cubit.getScenarios(),
      expect: () => [
        isA<WaterJugErrorState>(),
      ],
    );

    blocTest<WaterJugCubit, WaterJugState>(
      'emits [WaterJugInitialState] when onChangedJugOne is called',
      build: () => cubit,
      act: (cubit) => cubit.onChangedJugOne('2'),
      expect: () => [
        isA<WaterJugInitialState>(),
      ],
    );

    blocTest<WaterJugCubit, WaterJugState>(
      'emits [WaterJugInitialState] when onChangedJugTwo is called',
      build: () => cubit,
      act: (cubit) => cubit.onChangedJugTwo('5'),
      expect: () => [
        isA<WaterJugInitialState>(),
      ],
    );

    blocTest<WaterJugCubit, WaterJugState>(
      'emits [WaterJugInitialState] when onChangedWantedAmount is called',
      build: () => cubit,
      act: (cubit) => cubit.onChangedWantedAmount('4'),
      expect: () => [
        isA<WaterJugInitialState>(),
      ],
    );
  });
}

part of 'water_jug_cubit.dart';

sealed class WaterJugState extends Equatable {
  const WaterJugState({
    this.jugOne = 0,
    this.jugTwo = 0,
    this.wantedAmount = 0,
  });

  final int jugOne;
  final int jugTwo;
  final int wantedAmount;

  WaterJugInitialState copyWith({
    int? jugOne,
    int? jugTwo,
    int? wantedAmount,
  }) =>
      WaterJugInitialState(
        jugOne: jugOne ?? this.jugOne,
        jugTwo: jugTwo ?? this.jugTwo,
        wantedAmount: wantedAmount ?? this.wantedAmount,
      );

  @override
  List<Object> get props => [jugOne, jugTwo, wantedAmount];
}

final class WaterJugInitialState extends WaterJugState {
  const WaterJugInitialState({
    super.jugOne,
    super.jugTwo,
    super.wantedAmount,
  });
}

final class WaterJugErrorState extends WaterJugState {
  const WaterJugErrorState({
    required this.errorMessage,
    required super.jugOne,
    required super.jugTwo,
    required super.wantedAmount,
  });

  final String errorMessage;

  @override
  List<Object> get props => [...super.props, errorMessage];
}

final class WaterJugSuccessState extends WaterJugState {
  const WaterJugSuccessState({
    required this.allScenarios,
    required super.jugOne,
    required super.jugTwo,
    required super.wantedAmount,
  });

  final AllScenariosEntity allScenarios;

  @override
  List<Object> get props => [...super.props, allScenarios];
}

part of 'water_jug_cubit.dart';

sealed class WaterJugState extends Equatable {
  const WaterJugState();
  @override
  List<Object> get props => [];
}

final class WaterJugInitialState extends WaterJugState {
  const WaterJugInitialState();
}

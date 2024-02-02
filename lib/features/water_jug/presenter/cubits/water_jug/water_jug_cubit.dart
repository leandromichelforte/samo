import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'water_jug_state.dart';

final class WaterJugCubit extends Cubit<WaterJugState> {
  WaterJugCubit() : super(const WaterJugInitialState());
}

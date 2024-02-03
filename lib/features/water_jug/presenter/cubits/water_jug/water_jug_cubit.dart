import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

part 'water_jug_state.dart';

final class WaterJugCubit extends Cubit<WaterJugState> {
  WaterJugCubit({
    required ValidateValuesUsecase validateValuesUsecase,
    required GetAllScenariosUsecase getAllScenariosUsecase,
  })  : _validateValuesUsecase = validateValuesUsecase,
        _getAllScenariosUsecase = getAllScenariosUsecase,
        super(const WaterJugInitialState());

  final GetAllScenariosUsecase _getAllScenariosUsecase;
  final ValidateValuesUsecase _validateValuesUsecase;

  void getScenarios() {
    emit(state.copyWith());
    final validateValuesEither = _validateValuesUsecase(
      jugOne: state.jugOne,
      jugTwo: state.jugTwo,
      wantedAmount: state.wantedAmount,
    );
    validateValuesEither.fold((errorMessage) {
      emit(
        WaterJugErrorState(
          errorMessage: errorMessage,
          jugOne: state.jugOne,
          jugTwo: state.jugTwo,
          wantedAmount: state.wantedAmount,
        ),
      );
    }, (_) {
      final allScenarios = _getAllScenariosUsecase(
        jugOne: state.jugOne,
        jugTwo: state.jugTwo,
        wantedAmount: state.wantedAmount,
      );

      emit(
        WaterJugSuccessState(
          allScenarios: allScenarios,
          jugOne: state.jugOne,
          jugTwo: state.jugTwo,
          wantedAmount: state.wantedAmount,
        ),
      );
    });
  }

  void onChangedJugOne(String jugOne) {
    emit(
      state.copyWith(
        jugOne: int.tryParse(jugOne) ?? 0,
      ),
    );
  }

  void onChangedJugTwo(String jugTwo) {
    emit(state.copyWith(
      jugTwo: int.tryParse(jugTwo) ?? 0,
    ));
  }

  void onChangedWantedAmount(String wantedAmount) {
    emit(
      state.copyWith(
        wantedAmount: int.tryParse(wantedAmount) ?? 0,
      ),
    );
  }
}

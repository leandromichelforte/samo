import 'package:samo/core/injections/instances/get_it/get_it_instance.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

sealed class WaterJugInject {
  static void inject() {
    getIt.registerFactory<GCDUsecase>(GCDUsecaseImpl.new);
    getIt.registerFactory<ValidateValuesUsecase>(
      () => ValidateValuesUsecaseImpl(
        gcdUsecase: getIt.get<GCDUsecase>(),
      ),
    );
    getIt.registerFactory<GetStepListUsecase>(GetStepListUsecaseImpl.new);
    getIt.registerFactory<GetAllScenariosUsecase>(
      () => GetAllScenariosUsecaseImpl(
        getStepListUsecase: getIt.get<GetStepListUsecase>(),
      ),
    );
  }
}

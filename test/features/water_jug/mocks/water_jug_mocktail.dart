import 'package:mocktail/mocktail.dart';
import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

class MockGCDUsecase extends Mock implements GCDUsecase {}

class MockGetStepListUsecase extends Mock implements GetStepListUsecase {}

class MockValidateValuesUsecase extends Mock implements ValidateValuesUsecase {}

class MockGetAllScenariosUsecase extends Mock
    implements GetAllScenariosUsecase {}

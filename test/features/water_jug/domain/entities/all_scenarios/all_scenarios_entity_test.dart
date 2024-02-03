import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/water_jug_mocks.dart';

void main() {
  group('All Scenarios Entity ||', () {
    test('should be same entity', () {
      expect(
        WaterJugMocks.allScenariosEntity,
        WaterJugMocks.allScenariosEntityEqual,
      );
    });
    test('hashcode should be equal', () {
      expect(
        WaterJugMocks.allScenariosEntity.hashCode,
        WaterJugMocks.allScenariosEntityEqual.hashCode,
      );
    });
  });
}

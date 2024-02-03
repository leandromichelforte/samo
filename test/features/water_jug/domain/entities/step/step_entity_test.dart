import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/water_jug_mocks.dart';

void main() {
  group('Step Entity ||', () {
    test('should be same entity', () {
      expect(
        WaterJugMocks.stepEntity,
        WaterJugMocks.stepEntityEqual,
      );
    });
    test('hashcode should be equal', () {
      expect(
        WaterJugMocks.stepEntity.hashCode,
        WaterJugMocks.stepEntityEqual.hashCode,
      );
    });
  });
}

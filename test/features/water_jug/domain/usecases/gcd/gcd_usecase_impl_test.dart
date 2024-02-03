import 'package:flutter_test/flutter_test.dart';
import 'package:samo/features/water_jug/domain/usecases/gcd/gcd_usecase_impl.dart';

void main() {
  group('GCD Usecase Impl ||', () {
    test(
        'should return the greatest common divisor (6) of two numbers (12 and 18)',
        () {
      const usecase = GCDUsecaseImpl();
      const x = 12;
      const y = 18;
      const expectedGCD = 6;

      final result = usecase(x: x, y: y);

      expect(result, expectedGCD);
    });
  });
}

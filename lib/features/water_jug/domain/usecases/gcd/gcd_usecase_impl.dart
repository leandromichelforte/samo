import 'package:samo/features/water_jug/domain/usecases/usecases.dart';

final class GCDUsecaseImpl implements GCDUsecase {
  const GCDUsecaseImpl();

  int _gcd({required int x, required int y}) {
    if (y == 0) {
      return x;
    }
    return _gcd(x: y, y: x % y);
  }

  @override
  int call({
    required int x,
    required int y,
  }) {
    return _gcd(x: x, y: y);
  }
}

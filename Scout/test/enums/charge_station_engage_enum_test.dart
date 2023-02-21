import 'package:scout/enums/charge_station_engage_order_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in EngageOrderEnum.values) {
      // When / Then
      expect(EngageOrderExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => EngageOrderExtension.fromValue(-1), throwsA(isA<Exception>()));
  });
}

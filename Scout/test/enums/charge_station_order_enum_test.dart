import 'package:scout/enums/charge_station_order_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in ChargeStationOrderEnum.values) {
      // When / Then
      expect(ChargeStationOrderEnumExtension.fromValue(element.index), element);
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => ChargeStationOrderEnumExtension.fromValue(-1),
        throwsA(isA<Exception>()));
  });
}

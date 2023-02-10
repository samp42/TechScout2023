import 'package:scout/enums/pickup_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in PickupEnum.values) {
      // When / Then
      expect(PickupEnumExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => PickupEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

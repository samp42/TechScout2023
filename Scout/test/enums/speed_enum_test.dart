import 'package:scout/enums/speed_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in SpeedEnum.values) {
      // When / Then
      expect(SpeedEnumExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => SpeedEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

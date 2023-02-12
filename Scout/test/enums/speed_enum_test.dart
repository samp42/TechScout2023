import 'package:scout/enums/speed.dart';
import 'package:test/test.dart';
void main() {
  test('test fromValue when happy', () {
    for (var element in SpeedEnum.values) {
      // When / Then
      expect(SpeedExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => SpeedExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}
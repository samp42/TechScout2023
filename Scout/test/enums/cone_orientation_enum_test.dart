import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in ConeOrientationEnum.values) {
      // When / Then
      expect(ConeOrientationEnumExtension.fromValue(element.value),
          equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => ConeOrientationEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

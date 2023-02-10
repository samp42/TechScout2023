import 'package:scout/enums/driver_experience_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in DriverExperienceEnum.values) {
      // When / Then
      expect(DriverExperienceEnumExtension.fromValue(element.value),
          equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => DriverExperienceEnumExtension.fromValue(-1),
        throwsA(isA<Exception>()));
  });
}

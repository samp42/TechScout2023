import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in DriveBaseTypeEnum.values) {
      // When / Then
      expect(
          DriveBaseTypeEnumExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => DriveBaseTypeEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

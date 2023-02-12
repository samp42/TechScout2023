import 'package:scout/enums/coopertition_attempt_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in CoopertitionAttemptEnum.values) {
      // When / Then
      expect(CoopertitionAttemptExtension.fromValue(element.value),
          equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => CoopertitionAttemptExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}
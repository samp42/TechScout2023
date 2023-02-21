import 'package:scout/enums/card_color_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in CardColorEnum.values) {
      // When / Then
      expect(CardColorExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => CardColorExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

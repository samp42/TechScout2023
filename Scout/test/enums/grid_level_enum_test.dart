import 'package:scout/enums/grid_level_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in GridLevelEnum.values) {
      // When / Then
      expect(GridLevelEnumExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => GridLevelEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}

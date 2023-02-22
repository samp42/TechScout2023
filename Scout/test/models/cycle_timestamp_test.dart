import 'package:scout/enums/teleop_action_enum.dart';
import 'package:scout/models/cycle_timestamp.dart';

import 'package:test/test.dart';

void main() {
  test('test fromMap', () {
    for (var element in TeleopActionEnum.values) {
      // Given
      Map<String, dynamic> map = {
        'timestamp': 1,
        'action': element.value,
      };

      // When
      TeleopActionEnum actual =
          TeleopActionEnumExtension.fromValue(map['action']);

      // Then
      expect(actual, element);
    }
  });

  test('test toJson', () {
    for (var element in TeleopActionEnum.values) {
      // Given
      String expected = '{"timestamp":1,"action":"${element.value}"}';

      // When
      String actual = CycleTimestamp(
        timestamp: 1,
        action: element,
      ).toJson();

      // Then
      expect(actual, equals(expected));
    }
  });

  test('test equals when true', () {
    // Given
    CycleTimestamp cycle1 = const CycleTimestamp(
      timestamp: 1,
      action: TeleopActionEnum.intakeCone,
    );
    CycleTimestamp cycle2 = const CycleTimestamp(
      timestamp: 1,
      action: TeleopActionEnum.intakeCone,
    );

    // When
    bool equals = cycle1.equals(cycle2);

    // Then
    expect(equals, true);
  });
}

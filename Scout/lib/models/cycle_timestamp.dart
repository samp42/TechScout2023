import 'package:scout/enums/teleop_action_enum.dart';

class CycleTimestamp {
  final int timestamp;
  final TeleopActionEnum action;

  const CycleTimestamp({required this.timestamp, required this.action});

  static CycleTimestamp fromMap(Map<String, dynamic> map) {
    return CycleTimestamp(
      timestamp: map['timestamp'],
      action: TeleopActionEnumExtension.fromValue(map['action']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'action': action.value,
    };
  }

  bool equals(CycleTimestamp other) {
    return timestamp == other.timestamp && action == other.action;
  }
}

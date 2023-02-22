import 'dart:convert';

import 'package:scout/enums/teleop_action_enum.dart';

class CycleTimestamp {
  final double timestamp;
  final TeleopActionEnum action;

  const CycleTimestamp({required this.timestamp, required this.action});

  static CycleTimestamp fromMap(Map<String, dynamic> map) {
    return CycleTimestamp(
      timestamp: map['timestamp'].toDouble(),
      action: TeleopActionEnumExtension.fromValue(map['action']),
    );
  }

  Map<String, dynamic> _toMap() {
    return {
      'timestamp': timestamp.round(),
      'action': action.value,
    };
  }

  String toJson() => jsonEncode(_toMap());

  bool equals(CycleTimestamp other) {
    return timestamp == other.timestamp && action == other.action;
  }
}

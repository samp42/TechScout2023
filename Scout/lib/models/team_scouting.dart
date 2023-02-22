import 'dart:convert';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/models/cycle_timestamp.dart';

class TeamScouting {
  late String scoutName;
  late int teamNumber;
  late int matchNumber;

  // Autonomous
  late bool mobility;
  late ChargeStationEnum chargeStationAuto;
  late Map<GridLevelEnum, int> conesAuto;
  late Map<GridLevelEnum, int> cubesAuto;

  // Teleop
  late List<CycleTimestamp> cycles;
  late int penalties;

  // End Game
  late ChargeStationEnum chargeStationEndgame;
  late ChargeStationOrderEnum chargeStationOrder;
  late CardColorEnum card;

  TeamScouting();

  TeamScouting.allArgs({
    required this.matchNumber,
    required this.teamNumber,
    required this.scoutName,
    required this.mobility,
    required this.chargeStationAuto,
    required this.conesAuto,
    required this.cubesAuto,
    required this.cycles,
    required this.penalties,
    required this.chargeStationEndgame,
    required this.chargeStationOrder,
    required this.card,
  });

  TeamScouting.fromMap(Map<String, dynamic> map)
      : matchNumber = map['matchNumber'],
        teamNumber = map['teamNumber'],
        scoutName = map['scoutName'],
        mobility = map['mobility'],
        chargeStationAuto =
            ChargeStationEnumExtension.fromValue(map['chargeStationAuto']),
        conesAuto = map['conesAuto']
            .cast<String, int>()
            .map((k, v) => MapEntry(GridLevelEnumExtension.fromValue(k), v))
            .cast<GridLevelEnum, int>(),
        cubesAuto = map['cubesAuto']
            .cast<String, int>()
            .map((k, v) => MapEntry(GridLevelEnumExtension.fromValue(k), v))
            .cast<GridLevelEnum, int>(),
        cycles = map['cycles']
            .map<CycleTimestamp>((e) => CycleTimestamp.fromMap(e))
            .toList(),
        penalties = map['penalties'],
        chargeStationEndgame =
            ChargeStationEnumExtension.fromValue(map['chargeStationEndgame']),
        chargeStationOrder = ChargeStationOrderEnumExtension.fromValue(
            map['chargeStationOrder']),
        card = CardColorEnumExtension.fromValue(map['card']);

  Map<String, dynamic> _toMap() {
    return {
      'matchNumber': matchNumber,
      'teamNumber': teamNumber,
      'scoutName': scoutName,
      'mobility': mobility,
      'chargeStationAuto': chargeStationAuto.value,
      'conesAuto': conesAuto.map((k, v) => MapEntry(k.value, v)).toString(),
      'cubesAuto': cubesAuto.map((k, v) => MapEntry(k.value, v)).toString(),
      'cycles': cycles.map((c) => c.toJson()).toList(),
      'penalties': penalties,
      'chargeStationEndgame': chargeStationEndgame.value,
      'chargeStationOrder': chargeStationOrder.index,
      'card': card.value,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

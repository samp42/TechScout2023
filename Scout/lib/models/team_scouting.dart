import 'dart:convert';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_auto_enum.dart';
import 'package:scout/enums/charge_station_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/models/cycle_timestamp.dart';

class TeamScouting {
  late bool practice;
  late String scoutName;
  late int teamNumber;
  late int matchNumber;

  // Autonomous
  late bool mobility;
  late ChargeStationAutoEnum chargeStationAuto;
  late int conesAuto;
  late int cubesAuto;

  // Teleop
  late List<CycleTimestamp> cycles;

  // End Game
  late ChargeStationEnum chargeStationEndgame;
  late ChargeStationOrderEnum chargeStationOrder;
  late CardColorEnum card;

  TeamScouting();

  TeamScouting.entry() {
    practice = false;
    mobility = false;
    chargeStationAuto = ChargeStationAutoEnum.none;
    conesAuto = 0;
    cubesAuto = 0;
    cycles = [];
    chargeStationEndgame = ChargeStationEnum.none;
    chargeStationOrder = ChargeStationOrderEnum.none;
    card = CardColorEnum.none;
  }

  TeamScouting.allArgs({
    required this.practice,
    required this.matchNumber,
    required this.teamNumber,
    required this.scoutName,
    required this.mobility,
    required this.chargeStationAuto,
    required this.conesAuto,
    required this.cubesAuto,
    required this.cycles,
    required this.chargeStationEndgame,
    required this.chargeStationOrder,
    required this.card,
  });

  TeamScouting.fromMap(Map<String, dynamic> map)
      : practice = map['practice'],
        matchNumber = map['matchNumber'],
        teamNumber = map['teamNumber'],
        scoutName = map['scoutName'],
        mobility = map['mobility'],
        chargeStationAuto =
            ChargeStationAutoEnumExtension.fromValue(map['chargeStationAuto']),
        conesAuto = map['conesAuto'],
        cubesAuto = map['cubesAuto'],
        cycles = map['cycles']
            .map<CycleTimestamp>((e) => CycleTimestamp.fromMap(e))
            .toList(),
        chargeStationEndgame =
            ChargeStationEnumExtension.fromValue(map['chargeStationEndgame']),
        chargeStationOrder = ChargeStationOrderEnumExtension.fromValue(
            map['chargeStationOrder']),
        card = CardColorEnumExtension.fromValue(map['card']);

  Map<String, dynamic> _toMap() {
    return {
      'practice': practice,
      'matchNumber': matchNumber,
      'teamNumber': teamNumber,
      'scoutName': scoutName,
      'mobility': mobility,
      'chargeStationAuto': chargeStationAuto.value,
      'conesAuto': conesAuto,
      'cubesAuto': cubesAuto,
      'cycles': cycles.map((c) => c.toMap()).toList(),
      'chargeStationEndgame': chargeStationEndgame.value,
      'chargeStationOrder': chargeStationOrder.value,
      'card': card.value,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

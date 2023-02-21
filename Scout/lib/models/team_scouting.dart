import 'dart:convert';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_engage_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/speed.dart';

class TeamScouting {
  String scoutName;
  int teamNumber;
  int matchNumber;

  // Autonomous
  bool mobility;
  List<ChargeStationEnum> chargeStation;
  int scoringGridCones;
  int scoringGridCubes;

  // Teleop
  double robotCycleTimer;
  SpeedEnum robotSpeed;
  SpeedEnum placementSpeedCones;
  SpeedEnum placementSpeedCubes;
  SpeedEnum pickupSpeedCones;
  SpeedEnum pickupSpeedCubes;
  int dropCounterCones;
  int dropCounterCubes;
  int scoringGridTeleopCones;
  int scoringGridTeleopCubes;
  int penalties;

  // End Game
  List<ChargeStationEnum> chargedStationEndgame;
  List<EngageOrderEnum> engageOrder;
  CardColorEnum card;

  TeamScouting({
    required this.matchNumber,
    required this.teamNumber,
    required this.scoutName,
    required this.mobility,
    required this.chargeStation,
    required this.scoringGridCones,
    required this.scoringGridCubes,
    required this.robotCycleTimer,
    required this.robotSpeed,
    required this.placementSpeedCones,
    required this.placementSpeedCubes,
    required this.pickupSpeedCones,
    required this.pickupSpeedCubes,
    required this.dropCounterCones,
    required this.dropCounterCubes,
    required this.scoringGridTeleopCones,
    required this.scoringGridTeleopCubes,
    required this.penalties,
    required this.chargedStationEndgame,
    required this.engageOrder,
    required this.card,
  });

  TeamScouting.fromMap(Map<String, dynamic> map)
      : matchNumber = map['matchNumber'],
        teamNumber = map['teamNumber'],
        scoutName = map['scoutName'],
        mobility = map['mobility'],
        chargeStation = map['chargeStation']
            .map<ChargeStationEnum>(
                (e) => ChargedStationEnumExtension.fromValue(e))
            .toList(),
        scoringGridCones = map['scoringGridCones'],
        scoringGridCubes = map['scoringGridCubes'],
        robotCycleTimer = map['robotCycleTimer'],
        robotSpeed = map['robotSpeed']
            .map<SpeedEnum>((e) => SpeedExtension.fromValue(e))
            .toList(),
        placementSpeedCones = map['placementSpeedCones']
            .map<SpeedEnum>((e) => SpeedExtension.fromValue(e))
            .toList(),
        placementSpeedCubes = map['placementSpeedCubes']
            .map<SpeedEnum>((e) => SpeedExtension.fromValue(e))
            .toList(),
        pickupSpeedCones = map['pickupSpeedCones']
            .map<SpeedEnum>((e) => SpeedExtension.fromValue(e))
            .toList(),
        pickupSpeedCubes = map['pickupSpeedCubes']
            .map<SpeedEnum>((e) => SpeedExtension.fromValue(e))
            .toList(),
        dropCounterCones = map['canDropCones'],
        dropCounterCubes = map['canDropCubes'],
        scoringGridTeleopCones = map['scoringGridTeleopCones'],
        scoringGridTeleopCubes = map['scoringGridTeleopCubes'],
        penalties = map['penalties'],
        chargedStationEndgame = map['chargedStationEndgame']
            .map<ChargeStationEnum>(
                (e) => ChargedStationEnumExtension.fromValue(e))
            .toList(),
        engageOrder = map['engageOrder']
            .map<EngageOrderEnum>((e) => EngageOrderExtension.fromValue(e))
            .toList(),
        card = map['card']
            .map<CardColorEnum>((e) => CardColorExtension.fromValue(e))
            .toList();

  Map<String, dynamic> _toMap() {
    return {
      'matchNumber': matchNumber,
      'teamNumber': teamNumber,
      'scoutName': scoutName,
      'mobility': mobility,
      'chargeStation': chargeStation.map((e) => e.value).toList(),
      'scoringGridCones': scoringGridCones,
      'scoringGridCubes': scoringGridCubes,
      'robotCycleTimer': robotCycleTimer,
      'robotSpeed': robotSpeed,
      'placementSpeedCones': placementSpeedCones,
      'placementSpeedCubes': placementSpeedCubes,
      'pickupSpeedCones': pickupSpeedCones,
      'pickupSpeedCubes': pickupSpeedCubes,
      'canDropCones': dropCounterCones,
      'canDropCubes': dropCounterCubes,
      'scoringGridTeleopCones': scoringGridTeleopCones,
      'scoringGridTeleopCubes': scoringGridTeleopCubes,
      'penalties': penalties,
      'chargedStationEndgame':
          chargedStationEndgame.map((e) => e.value).toList(),
      'engageOrder': engageOrder.map((e) => e.value).toList(),
      'card': card,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

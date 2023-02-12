import 'dart:convert';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_engage_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/coopertition_attempt_enum.dart';
import 'package:scout/enums/speed.dart';


class MatchScouting {
  String scoutName;
  int teamNumber;
  int matchNumber;

  // Autonomous
  bool mobility;
  List<ChargedStationEnum> chargeStation;
  int scoringGridCones;
  int scoringGridCubes;
  int penaltiesAutonomous;

  // Teleop
  double robotCycleTimer;
  List<SpeedEnum> robotSpeed;
  List<SpeedEnum> placementSpeedCones;
  List<SpeedEnum> placementSpeedCubes;
  List<SpeedEnum> pickupSpeedCones;
  List<SpeedEnum> pickupSpeedCubes;
  bool canDropCones;
  bool canDropCubes;
  List<CoopertitionAttemptEnum> coopertition;
  int scoringGridTeleopCones;
  int scoringGridTeleopCubes;
  int penaltiesTeleop;

  // End Game
  List<ChargedStationEnum> chargedStationEndgame;
  List<EngageOrderEnum> engageOrder;
  int penaltiesEndgame;
  List<CardColorEnum> card;

  MatchScouting({
    required this.matchNumber,
    required this.teamNumber,
    required this.scoutName,
    required this.mobility,
    required this.chargeStation,
    required this.scoringGridCones,
    required this.scoringGridCubes,
    required this.penaltiesAutonomous,
    required this.robotCycleTimer,
    required this.robotSpeed,
    required this.placementSpeedCones,
    required this.placementSpeedCubes,
    required this.pickupSpeedCones,
    required this.pickupSpeedCubes,
    required this.canDropCones,
    required this.canDropCubes,
    required this.coopertition,
    required this.scoringGridTeleopCones,
    required this.scoringGridTeleopCubes,
    required this.penaltiesTeleop,
    required this.chargedStationEndgame,
    required this.engageOrder,
    required this.penaltiesEndgame,
    required this.card,
  });

  MatchScouting.fromMap(Map<String, dynamic> map)
    : matchNumber = map['matchNumber'],
      teamNumber = map['teamNumber'],
      scoutName = map['scoutName'],
      mobility = map['mobility'],
      chargeStation = map['chargeStation'].map<ChargedStationEnum>((e) => ChargedStationEnumExtension.fromValue(e)).toList(),
      scoringGridCones = map['scoringGridCones'],
      scoringGridCubes = map['scoringGridCubes'],
      penaltiesAutonomous = map['penaltiesAutonomous'],
      robotCycleTimer = map['robotCycleTimer'],
      robotSpeed = map['robotSpeed'].map<SpeedEnum>((e) => SpeedExtension.fromValue(e)).toList(),
      placementSpeedCones = map['placementSpeedCones'].map<SpeedEnum>((e) => SpeedExtension.fromValue(e)).toList(),
      placementSpeedCubes = map['placementSpeedCubes'].map<SpeedEnum>((e) => SpeedExtension.fromValue(e)).toList(),
      pickupSpeedCones = map['pickupSpeedCones'].map<SpeedEnum>((e) => SpeedExtension.fromValue(e)).toList(),
      pickupSpeedCubes = map['pickupSpeedCubes'].map<SpeedEnum>((e) => SpeedExtension.fromValue(e)).toList(),
      canDropCones = map['canDropCones'],
      canDropCubes = map['canDropCubes'],
      coopertition = map['coopertition'].map<CoopertitionAttemptEnum>((e) => CoopertitionAttemptExtension.fromValue(e)).toList(),
      scoringGridTeleopCones = map['scoringGridTeleopCones'],
      scoringGridTeleopCubes = map['scoringGridTeleopCubes'],
      penaltiesTeleop = map['penaltiesTeleop'],
      chargedStationEndgame = map['chargedStationEndgame'].map<ChargedStationEnum>((e) => ChargedStationEnumExtension.fromValue(e)).toList(),
      engageOrder = map['engageOrder'].map<EngageOrderEnum>((e) => EngageOrderExtension.fromValue(e)).toList(),
      penaltiesEndgame = map['penaltiesEndgame'],
      card = map['card'].map<CardColorEnum>((e) => CardColorExtension.fromValue(e)).toList();

  Map<String, dynamic> _toMap() {
    return {
      'matchNumber': matchNumber,
      'teamNumber': teamNumber,
      'scoutName': scoutName,
      'mobility': mobility,
      'chargeStation': chargeStation.map((e) => e.value).toList(),
      'scoringGridCones': scoringGridCones,
      'scoringGridCubes': scoringGridCubes,
      'penaltiesAutonomous': penaltiesAutonomous,
      'robotCycleTimer': robotCycleTimer,
      'robotSpeed': robotSpeed.map((e) => e.value).toList(),
      'placementSpeedCones': placementSpeedCones.map((e) => e.value).toList(),
      'placementSpeedCubes': placementSpeedCubes.map((e) => e.value).toList(),
      'pickupSpeedCones': pickupSpeedCones.map((e) => e.value).toList(),
      'pickupSpeedCubes': pickupSpeedCubes.map((e) => e.value).toList(),
      'canDropCones': canDropCones,
      'canDropCubes': canDropCubes,
      'coopertition': coopertition.map((e) => e.value).toList(),
      'scoringGridTeleopCones': scoringGridTeleopCones,
      'scoringGridTeleopCubes': scoringGridTeleopCubes,
      'penaltiesTeleop': penaltiesTeleop,
      'chargedStationEndgame': chargedStationEndgame.map((e) => e.value).toList(),
      'engageOrder': engageOrder.map((e) => e.value).toList(),
      'penaltiesEndgame': penaltiesEndgame,
      'card': card.map((e) => e.value).toList(),
    };
  }

  String toJson() => jsonEncode(_toMap());
}

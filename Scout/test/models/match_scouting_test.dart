import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_engage_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/coopertition_attempt_enum.dart';
import 'package:scout/enums/speed.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:test/test.dart';

void main() {
  final MatchScouting matchScouting = MatchScouting(
    matchNumber: 1,
    teamNumber: 1,
    scoutName: 'Test',
    mobility: true,
    chargeStation: [ChargedStationEnum.engage],
    scoringGridCones: 1,
    scoringGridCubes: 1,
    penaltiesAutonomous: 1,
    robotCycleTimer: 1,
    robotSpeed: [SpeedEnum.slow],
    placementSpeedCones: [SpeedEnum.slow],
    placementSpeedCubes: [SpeedEnum.slow],
    pickupSpeedCones: [SpeedEnum.slow],
    pickupSpeedCubes: [SpeedEnum.slow],
    canDropCones: true,
    canDropCubes: true,
    coopertition: [CoopertitionAttemptEnum.triedAndSucceeded],
    scoringGridTeleopCones: 1,
    scoringGridTeleopCubes: 1,
    penaltiesTeleop: 1,
    chargedStationEndgame: [ChargedStationEnum.engage],
    engageOrder: [EngageOrderEnum.engage1st],
    penaltiesEndgame: 1,
    card: [CardColorEnum.red],
  );

  test('Test fromMap', (){
    //Given When
    MatchScouting matchScoutActual = MatchScouting.fromMap({
      'matchNumber': 1,
      'teamNumber': 1,
      'scoutName': 'Test',
      'mobility': true,
      'chargeStation': ['engage'],
      'scoringGridCones': 1,
      'scoringGridCubes': 1,
      'penaltiesAutonomous': 1,
      'robotCycleTimer': 1.0,
      'robotSpeed': ['slow'],
      'placementSpeedCones': ['slow'],
      'placementSpeedCubes': ['slow'],
      'pickupSpeedCones': ['slow'],
      'pickupSpeedCubes': ['slow'],
      'canDropCones': true,
      'canDropCubes': true,
      'coopertition': ['Tried and succeeded'],
      'scoringGridTeleopCones': 1,
      'scoringGridTeleopCubes': 1,
      'penaltiesTeleop': 1,
      'chargedStationEndgame': ['engage'],
      'engageOrder': [1],
      'penaltiesEndgame': 1,
      'card': ['red'],
    });

    //Then
    expect(matchScoutActual.matchNumber, equals(matchScouting.matchNumber));
    expect(matchScoutActual.teamNumber, equals(matchScouting.teamNumber));
    expect(matchScoutActual.scoutName, equals(matchScouting.scoutName));
    expect(matchScoutActual.mobility, equals(matchScouting.mobility));
    expect(matchScoutActual.chargeStation, equals(matchScouting.chargeStation));
    expect(matchScoutActual.scoringGridCones, equals(matchScouting.scoringGridCones));
    expect(matchScoutActual.scoringGridCubes, equals(matchScouting.scoringGridCubes));
    expect(matchScoutActual.penaltiesAutonomous, equals(matchScouting.penaltiesAutonomous));
    expect(matchScoutActual.robotCycleTimer, equals(matchScouting.robotCycleTimer));
    expect(matchScoutActual.robotSpeed, equals(matchScouting.robotSpeed));
    expect(matchScoutActual.placementSpeedCones, equals(matchScouting.placementSpeedCones));
    expect(matchScoutActual.placementSpeedCubes, equals(matchScouting.placementSpeedCubes));
    expect(matchScoutActual.pickupSpeedCones, equals(matchScouting.pickupSpeedCones));
    expect(matchScoutActual.pickupSpeedCubes, equals(matchScouting.pickupSpeedCubes));
    expect(matchScoutActual.canDropCones, equals(matchScouting.canDropCones));
    expect(matchScoutActual.canDropCubes, equals(matchScouting.canDropCubes));
    expect(matchScoutActual.coopertition, equals(matchScouting.coopertition));
    expect(matchScoutActual.scoringGridTeleopCones, equals(matchScouting.scoringGridTeleopCones));
    expect(matchScoutActual.scoringGridTeleopCubes, equals(matchScouting.scoringGridTeleopCubes));
    expect(matchScoutActual.penaltiesTeleop, equals(matchScouting.penaltiesTeleop));
    expect(matchScoutActual.chargedStationEndgame, equals(matchScouting.chargedStationEndgame));
    expect(matchScoutActual.engageOrder, equals(matchScouting.engageOrder));
    expect(matchScoutActual.penaltiesEndgame, equals(matchScouting.penaltiesEndgame));
    expect(matchScoutActual.card, equals(matchScouting.card));
  });

  test('test fromMap from json file', (){
    //Given
    File matchScoutingFile = File('test_resources/match_scouting.json');
    String matchScoutingJson = matchScoutingFile.readAsStringSync();
    Map<String, dynamic> matchScoutingMap = jsonDecode(matchScoutingJson);

    //When
    MatchScouting matchScoutActual = MatchScouting.fromMap(matchScoutingMap);

    //Then
    expect(matchScoutActual.matchNumber, equals(matchScouting.matchNumber));
    expect(matchScoutActual.teamNumber, equals(matchScouting.teamNumber));
    expect(matchScoutActual.scoutName, equals(matchScouting.scoutName));
    expect(matchScoutActual.mobility, equals(matchScouting.mobility));
    expect(matchScoutActual.chargeStation, equals(matchScouting.chargeStation));
    expect(matchScoutActual.scoringGridCones, equals(matchScouting.scoringGridCones));
    expect(matchScoutActual.scoringGridCubes, equals(matchScouting.scoringGridCubes));
    expect(matchScoutActual.penaltiesAutonomous, equals(matchScouting.penaltiesAutonomous));
    expect(matchScoutActual.robotCycleTimer, equals(matchScouting.robotCycleTimer));
    expect(matchScoutActual.robotSpeed, equals(matchScouting.robotSpeed));
    expect(matchScoutActual.placementSpeedCones, equals(matchScouting.placementSpeedCones));
    expect(matchScoutActual.placementSpeedCubes, equals(matchScouting.placementSpeedCubes));
    expect(matchScoutActual.pickupSpeedCones, equals(matchScouting.pickupSpeedCones));
    expect(matchScoutActual.pickupSpeedCubes, equals(matchScouting.pickupSpeedCubes));
    expect(matchScoutActual.canDropCones, equals(matchScouting.canDropCones));
    expect(matchScoutActual.canDropCubes, equals(matchScouting.canDropCubes));
    expect(matchScoutActual.coopertition, equals(matchScouting.coopertition));
    expect(matchScoutActual.scoringGridTeleopCones, equals(matchScouting.scoringGridTeleopCones));
    expect(matchScoutActual.scoringGridTeleopCubes, equals(matchScouting.scoringGridTeleopCubes));
    expect(matchScoutActual.penaltiesTeleop, equals(matchScouting.penaltiesTeleop));
    expect(matchScoutActual.chargedStationEndgame, equals(matchScouting.chargedStationEndgame));
    expect(matchScoutActual.engageOrder, equals(matchScouting.engageOrder));
    expect(matchScoutActual.penaltiesEndgame, equals(matchScouting.penaltiesEndgame));
    expect(matchScoutActual.card, equals(matchScouting.card));
  });

  test('Test toJson', () {
    //Given
    File matchJsonFile = File('test_resources/match_scouting.json');
    String expectedMatchJsonString = matchJsonFile.readAsStringSync();
    Map<String, dynamic> expectedMatchJson =
        jsonDecode(expectedMatchJsonString);

    // When
    Map<String, dynamic> actualMatchJson = jsonDecode(matchScouting.toJson());

    //Then
    expect(actualMatchJson['matchNumber'], equals(expectedMatchJson['matchNumber']));
    expect(actualMatchJson['teamNumber'], equals(expectedMatchJson['teamNumber']));
    expect(actualMatchJson['scoutName'], equals(expectedMatchJson['scoutName']));
    expect(actualMatchJson['mobility'], equals(expectedMatchJson['mobility']));
    expect(actualMatchJson['chargeStation'], equals(expectedMatchJson['chargeStation']));
    expect(actualMatchJson['scoringGridCones'], equals(expectedMatchJson['scoringGridCones']));
    expect(actualMatchJson['scoringGridCubes'], equals(expectedMatchJson['scoringGridCubes']));
    expect(actualMatchJson['penaltiesAutonomous'], equals(expectedMatchJson['penaltiesAutonomous']));
    expect(actualMatchJson['robotCycleTimer'], equals(expectedMatchJson['robotCycleTimer']));
    expect(actualMatchJson['robotSpeed'], equals(expectedMatchJson['robotSpeed']));
    expect(actualMatchJson['placementSpeedCones'], equals(expectedMatchJson['placementSpeedCones']));
    expect(actualMatchJson['placementSpeedCubes'], equals(expectedMatchJson['placementSpeedCubes']));
    expect(actualMatchJson['pickupSpeedCones'], equals(expectedMatchJson['pickupSpeedCones']));
    expect(actualMatchJson['pickupSpeedCubes'], equals(expectedMatchJson['pickupSpeedCubes']));
    expect(actualMatchJson['canDropCones'], equals(expectedMatchJson['canDropCones']));
    expect(actualMatchJson['canDropCubes'], equals(expectedMatchJson['canDropCubes']));
    expect(actualMatchJson['coopertition'], equals(expectedMatchJson['coopertition']));
    expect(actualMatchJson['scoringGridTeleopCones'], equals(expectedMatchJson['scoringGridTeleopCones']));
    expect(actualMatchJson['scoringGridTeleopCubes'], equals(expectedMatchJson['scoringGridTeleopCubes']));
    expect(actualMatchJson['penaltiesTeleop'], equals(expectedMatchJson['penaltiesTeleop']));
    expect(actualMatchJson['chargedStationEndgame'], equals(expectedMatchJson['chargedStationEndgame']));
    expect(actualMatchJson['engageOrder'], equals(expectedMatchJson['engageOrder']));
    expect(actualMatchJson['penaltiesEndgame'], equals(expectedMatchJson['penaltiesEndgame']));
    expect(actualMatchJson['card'], equals(expectedMatchJson['card']));
  });
}
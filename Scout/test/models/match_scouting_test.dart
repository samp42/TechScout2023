import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_engage_order_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/speed.dart';
import 'package:scout/models/team_scouting.dart';
import 'package:test/test.dart';

void main() {
  final TeamScouting teamScouting = TeamScouting(
    matchNumber: 1,
    teamNumber: 1,
    scoutName: 'Test',
    mobility: true,
    chargeStation: [ChargeStationEnum.engage],
    scoringGridCones: 1,
    scoringGridCubes: 1,
    robotCycleTimer: 1,
    robotSpeed: SpeedEnum.slow,
    placementSpeedCones: SpeedEnum.slow,
    placementSpeedCubes: SpeedEnum.slow,
    pickupSpeedCones: SpeedEnum.slow,
    pickupSpeedCubes: SpeedEnum.slow,
    dropCounterCones: 5,
    dropCounterCubes: 8,
    scoringGridTeleopCones: 1,
    scoringGridTeleopCubes: 1,
    penalties: 4,
    chargedStationEndgame: ChargeStationEnum.engage,
    engageOrder: [EngageOrderEnum.engage1st],
    card: CardColorEnum.red,
  );

  test('Test fromMap', () {
    //Given When
    TeamScouting teamScoutingActual = TeamScouting.fromMap({
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
    expect(teamScoutingActual.matchNumber, equals(teamScouting.matchNumber));
    expect(teamScoutingActual.teamNumber, equals(teamScouting.teamNumber));
    expect(teamScoutingActual.scoutName, equals(teamScouting.scoutName));
    expect(teamScoutingActual.mobility, equals(teamScouting.mobility));
    expect(
        teamScoutingActual.chargeStation, equals(teamScouting.chargeStation));
    expect(teamScoutingActual.scoringGridCones,
        equals(teamScouting.scoringGridCones));
    expect(teamScoutingActual.scoringGridCubes,
        equals(teamScouting.scoringGridCubes));

    expect(teamScoutingActual.robotCycleTimer,
        equals(teamScouting.robotCycleTimer));
    expect(teamScoutingActual.robotSpeed, equals(teamScouting.robotSpeed));
    expect(teamScoutingActual.placementSpeedCones,
        equals(teamScouting.placementSpeedCones));
    expect(teamScoutingActual.placementSpeedCubes,
        equals(teamScouting.placementSpeedCubes));
    expect(teamScoutingActual.pickupSpeedCones,
        equals(teamScouting.pickupSpeedCones));
    expect(teamScoutingActual.pickupSpeedCubes,
        equals(teamScouting.pickupSpeedCubes));
    expect(teamScoutingActual.dropCounterCones,
        equals(teamScouting.dropCounterCones));
    expect(teamScoutingActual.dropCounterCubes,
        equals(teamScouting.dropCounterCubes));
    expect(teamScoutingActual.scoringGridTeleopCones,
        equals(teamScouting.scoringGridTeleopCones));
    expect(teamScoutingActual.scoringGridTeleopCubes,
        equals(teamScouting.scoringGridTeleopCubes));
    expect(teamScoutingActual.penalties, equals(teamScouting.penalties));
    expect(teamScoutingActual.chargedStationEndgame,
        equals(teamScouting.chargedStationEndgame));
    expect(teamScoutingActual.engageOrder, equals(teamScouting.engageOrder));

    expect(teamScoutingActual.card, equals(teamScouting.card));
  });

  test('test fromMap from json file', () {
    //Given
    File teamScoutingFile = File('test_resources/match_scouting.json');
    String teamScoutingJson = teamScoutingFile.readAsStringSync();
    Map<String, dynamic> teamScoutingMap = jsonDecode(teamScoutingJson);

    //When
    TeamScouting teamScoutingActual = TeamScouting.fromMap(teamScoutingMap);

    //Then
    expect(teamScoutingActual.matchNumber, equals(teamScouting.matchNumber));
    expect(teamScoutingActual.teamNumber, equals(teamScouting.teamNumber));
    expect(teamScoutingActual.scoutName, equals(teamScouting.scoutName));
    expect(teamScoutingActual.mobility, equals(teamScouting.mobility));
    expect(
        teamScoutingActual.chargeStation, equals(teamScouting.chargeStation));
    expect(teamScoutingActual.scoringGridCones,
        equals(teamScouting.scoringGridCones));
    expect(teamScoutingActual.scoringGridCubes,
        equals(teamScouting.scoringGridCubes));

    expect(teamScoutingActual.robotCycleTimer,
        equals(teamScouting.robotCycleTimer));
    expect(teamScoutingActual.robotSpeed, equals(teamScouting.robotSpeed));
    expect(teamScoutingActual.placementSpeedCones,
        equals(teamScouting.placementSpeedCones));
    expect(teamScoutingActual.placementSpeedCubes,
        equals(teamScouting.placementSpeedCubes));
    expect(teamScoutingActual.pickupSpeedCones,
        equals(teamScouting.pickupSpeedCones));
    expect(teamScoutingActual.pickupSpeedCubes,
        equals(teamScouting.pickupSpeedCubes));
    expect(teamScoutingActual.dropCounterCones,
        equals(teamScouting.dropCounterCones));
    expect(teamScoutingActual.dropCounterCubes,
        equals(teamScouting.dropCounterCubes));
    expect(teamScoutingActual.scoringGridTeleopCones,
        equals(teamScouting.scoringGridTeleopCones));
    expect(teamScoutingActual.scoringGridTeleopCubes,
        equals(teamScouting.scoringGridTeleopCubes));
    expect(teamScoutingActual.penalties, equals(teamScouting.penalties));
    expect(teamScoutingActual.chargedStationEndgame,
        equals(teamScouting.chargedStationEndgame));
    expect(teamScoutingActual.engageOrder, equals(teamScouting.engageOrder));

    expect(teamScoutingActual.card, equals(teamScouting.card));
  });

  test('Test toJson', () {
    //Given
    File matchJsonFile = File('test_resources/match_scouting.json');
    String expectedMatchJsonString = matchJsonFile.readAsStringSync();
    Map<String, dynamic> expectedMatchJson =
        jsonDecode(expectedMatchJsonString);

    // When
    Map<String, dynamic> actualMatchJson = jsonDecode(teamScouting.toJson());

    //Then
    expect(actualMatchJson['matchNumber'],
        equals(expectedMatchJson['matchNumber']));
    expect(
        actualMatchJson['teamNumber'], equals(expectedMatchJson['teamNumber']));
    expect(
        actualMatchJson['scoutName'], equals(expectedMatchJson['scoutName']));
    expect(actualMatchJson['mobility'], equals(expectedMatchJson['mobility']));
    expect(actualMatchJson['chargeStation'],
        equals(expectedMatchJson['chargeStation']));
    expect(actualMatchJson['scoringGridCones'],
        equals(expectedMatchJson['scoringGridCones']));
    expect(actualMatchJson['scoringGridCubes'],
        equals(expectedMatchJson['scoringGridCubes']));
    expect(
        actualMatchJson['penalties'], equals(expectedMatchJson['penalties']));
    expect(actualMatchJson['robotCycleTimer'],
        equals(expectedMatchJson['robotCycleTimer']));
    expect(
        actualMatchJson['robotSpeed'], equals(expectedMatchJson['robotSpeed']));
    expect(actualMatchJson['placementSpeedCones'],
        equals(expectedMatchJson['placementSpeedCones']));
    expect(actualMatchJson['placementSpeedCubes'],
        equals(expectedMatchJson['placementSpeedCubes']));
    expect(actualMatchJson['pickupSpeedCones'],
        equals(expectedMatchJson['pickupSpeedCones']));
    expect(actualMatchJson['pickupSpeedCubes'],
        equals(expectedMatchJson['pickupSpeedCubes']));
    expect(actualMatchJson['canDropCones'],
        equals(expectedMatchJson['canDropCones']));
    expect(actualMatchJson['canDropCubes'],
        equals(expectedMatchJson['canDropCubes']));

    expect(actualMatchJson['scoringGridTeleopCones'],
        equals(expectedMatchJson['scoringGridTeleopCones']));
    expect(actualMatchJson['scoringGridTeleopCubes'],
        equals(expectedMatchJson['scoringGridTeleopCubes']));
    expect(actualMatchJson['penaltiesTeleop'],
        equals(expectedMatchJson['penaltiesTeleop']));
    expect(actualMatchJson['chargedStationEndgame'],
        equals(expectedMatchJson['chargedStationEndgame']));
    expect(actualMatchJson['engageOrder'],
        equals(expectedMatchJson['engageOrder']));

    expect(actualMatchJson['card'], equals(expectedMatchJson['card']));
  });
}

import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import 'package:scout/models/match_scouting.dart';

void main() {
  final matchScoutingMock = MatchScouting.allArgs(
    matchNumber: 1,
    scoutName: 'John Doe',
    redTeams: [3990, 3991, 3992],
    blueTeams: [3993, 3994, 3995],
    redLinks: 2,
    blueLinks: 1,
    redCoopertition: true,
    blueCoopertition: false,
    redEngaged: true,
    blueEngaged: false,
    redScore: 193,
    blueScore: 20,
    redPenalty: 0,
    bluePenalty: 25,
  );

  test('Test fromMap', () {
    // Given / When
    final actualMatchScouting = MatchScouting.fromMap({
      'matchNumber': 1,
      'scoutName': 'John Doe',
      'redTeams': [3990, 3991, 3992],
      'blueTeams': [3993, 3994, 3995],
      'redLinks': 2,
      'blueLinks': 1,
      'redCoopertition': true,
      'blueCoopertition': false,
      'redEngaged': true,
      'blueEngaged': false,
      'redScore': 193,
      'blueScore': 20,
      'redPenalty': 0,
      'bluePenalty': 25,
    });

    // Then
    expect(
        actualMatchScouting.matchNumber, equals(matchScoutingMock.matchNumber));
    expect(actualMatchScouting.scoutName, equals(matchScoutingMock.scoutName));
    expect(actualMatchScouting.redTeams, equals(matchScoutingMock.redTeams));
    expect(actualMatchScouting.blueTeams, equals(matchScoutingMock.blueTeams));
    expect(actualMatchScouting.redLinks, equals(matchScoutingMock.redLinks));
    expect(actualMatchScouting.blueLinks, equals(matchScoutingMock.blueLinks));
    expect(actualMatchScouting.redCoopertition,
        equals(matchScoutingMock.redCoopertition));
    expect(actualMatchScouting.blueCoopertition,
        equals(matchScoutingMock.blueCoopertition));
    expect(
        actualMatchScouting.redEngaged, equals(matchScoutingMock.redEngaged));
    expect(
        actualMatchScouting.blueEngaged, equals(matchScoutingMock.blueEngaged));
    expect(actualMatchScouting.redScore, equals(matchScoutingMock.redScore));
    expect(actualMatchScouting.blueScore, equals(matchScoutingMock.blueScore));
    expect(
        actualMatchScouting.redPenalty, equals(matchScoutingMock.redPenalty));
    expect(
        actualMatchScouting.bluePenalty, equals(matchScoutingMock.bluePenalty));
  });

  test('test fromMap from json file', () {
    // Given
    File matchJsonFile = File('test_resources/match_scouting.json');
    String matchJsonString = matchJsonFile.readAsStringSync();
    Map<String, dynamic> matchJsonMap = jsonDecode(matchJsonString);

    // When
    MatchScouting actualMatch = MatchScouting.fromMap(matchJsonMap);

    // Then
    expect(actualMatch.matchNumber, equals(matchScoutingMock.matchNumber));
    expect(actualMatch.scoutName, equals(matchScoutingMock.scoutName));
    expect(actualMatch.redTeams, equals(matchScoutingMock.redTeams));
    expect(actualMatch.blueTeams, equals(matchScoutingMock.blueTeams));
    expect(actualMatch.redLinks, equals(matchScoutingMock.redLinks));
    expect(actualMatch.blueLinks, equals(matchScoutingMock.blueLinks));
    expect(
        actualMatch.redCoopertition, equals(matchScoutingMock.redCoopertition));
    expect(actualMatch.blueCoopertition,
        equals(matchScoutingMock.blueCoopertition));
    expect(actualMatch.redEngaged, equals(matchScoutingMock.redEngaged));
    expect(actualMatch.blueEngaged, equals(matchScoutingMock.blueEngaged));
    expect(actualMatch.redScore, equals(matchScoutingMock.redScore));
    expect(actualMatch.blueScore, equals(matchScoutingMock.blueScore));
    expect(actualMatch.redPenalty, equals(matchScoutingMock.redPenalty));
    expect(actualMatch.bluePenalty, equals(matchScoutingMock.bluePenalty));
  });

  test('test toJson', () {
    // Given
    File matchJsonFile = File('test_resources/match_scouting.json');
    String matchJsonString = matchJsonFile.readAsStringSync();
    Map<String, dynamic> expectedMatchJson = jsonDecode(matchJsonString);

    // When
    Map<String, dynamic> actualMatchJson =
        jsonDecode(matchScoutingMock.toJson());

    // Then
    expect(actualMatchJson['matchNumber'],
        equals(expectedMatchJson['matchNumber']));
    expect(
        actualMatchJson['scoutName'], equals(expectedMatchJson['scoutName']));
    expect(actualMatchJson['redTeams'], equals(expectedMatchJson['redTeams']));
    expect(
        actualMatchJson['blueTeams'], equals(expectedMatchJson['blueTeams']));
    expect(actualMatchJson['redLinks'], equals(expectedMatchJson['redLinks']));
    expect(
        actualMatchJson['blueLinks'], equals(expectedMatchJson['blueLinks']));
    expect(actualMatchJson['redCoopertition'],
        equals(expectedMatchJson['redCoopertition']));
    expect(actualMatchJson['blueCoopertition'],
        equals(expectedMatchJson['blueCoopertition']));
    expect(
        actualMatchJson['redEngaged'], equals(expectedMatchJson['redEngaged']));
    expect(actualMatchJson['blueEngaged'],
        equals(expectedMatchJson['blueEngaged']));
    expect(actualMatchJson['redScore'], equals(expectedMatchJson['redScore']));
    expect(
        actualMatchJson['blueScore'], equals(expectedMatchJson['blueScore']));
    expect(
        actualMatchJson['redPenalty'], equals(expectedMatchJson['redPenalty']));
    expect(actualMatchJson['bluePenalty'],
        equals(expectedMatchJson['bluePenalty']));
  });
}

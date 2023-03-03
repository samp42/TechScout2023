import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';
import 'package:scout/models/pit_scouting.dart';
import 'package:test/test.dart';

void main() {
  final PitScouting robotMock = PitScouting.full(
    teamNumber: 3990,
    scoutName: 'John Doe',
    driverExperience: DriverExperienceEnum.firstYear,
    weight: 120,
    width: 28,
    length: 30,
    driveBaseType: DriveBaseTypeEnum.tank,
    stable: false,
    canIntakeCone: true,
    canIntakeCube: true,
    pickupSpotsCube: PickupEnum.tablet,
    pickupSpotsCone: PickupEnum.floor,
    intakeConeOrientations: [
      ConeOrientationEnum.pointingAway,
      ConeOrientationEnum.pointingTowards,
      ConeOrientationEnum.upRight,
      ConeOrientationEnum.sideways,
    ],
    gamePiecesNotes: "",
    gridScoringLevelsCube: [
      GridLevelEnum.bottom,
      GridLevelEnum.middle,
    ],
    gridScoringLevelsCone: [
      GridLevelEnum.bottom,
      GridLevelEnum.middle,
      GridLevelEnum.top,
    ],
    scoringNotes: 'We can only score cubes on the coopertition grid.',
    chargingStationNotes:
        'We can only park on the left side of the charging station.',
    haveSeparatedIntake: true,
  );

  test('test fromMap', () {
    // Given / When
    PitScouting actualRobot = PitScouting.fromMap({
      'teamNumber': 3990,
      'scoutName': 'John Doe',
      'driverExperience': 1,
      'weight': 120,
      'width': 28,
      'length': 30,
      'driveBaseType': 'tank',
      'stable': false,
      'canIntakeCone': true,
      'canIntakeCube': true,
      'pickupSpotsCube': ['floor', 'tablet'],
      'pickupSpotsCone': ['floor'],
      'intakeConeOrientations': [
        'pointing away',
        'pointing towards',
        'sideways',
        'up right'
      ],
      'gamePiecesNotes': '',
      'gridScoringLevelsCube': ['bottom', 'middle'],
      'gridScoringLevelsCone': ['bottom', 'middle', 'top'],
      'scoringNotes': 'We can only score cubes on the coopertition grid.',
      'chargingStationNotes':
          'We can only park on the left side of the charging station.',
    });

    // Then
    expect(actualRobot.teamNumber, equals(robotMock.teamNumber));
    expect(actualRobot.scoutName, equals(robotMock.scoutName));
    expect(actualRobot.driverExperience, equals(robotMock.driverExperience));
    expect(actualRobot.weight, equals(robotMock.weight));
    expect(actualRobot.width, equals(robotMock.width));
    expect(actualRobot.length, equals(robotMock.length));
    expect(actualRobot.driveBaseType, equals(robotMock.driveBaseType));
    expect(actualRobot.stable, equals(robotMock.stable));
    expect(actualRobot.canIntakeCone, equals(robotMock.canIntakeCone));
    expect(actualRobot.canIntakeCube, equals(robotMock.canIntakeCube));
    // expect to be equal ignoring order
    expect(actualRobot.pickupSpotsCube.toSet(),
        equals(robotMock.pickupSpotsCube.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.pickupSpotsCone.toSet(),
        equals(robotMock.pickupSpotsCone.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    expect(actualRobot.gamePiecesNotes, equals(robotMock.gamePiecesNotes));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCube.toSet(),
        equals(robotMock.gridScoringLevelsCube.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCone.toSet(),
        equals(robotMock.gridScoringLevelsCone.toSet()));
    expect(actualRobot.scoringNotes, equals(robotMock.scoringNotes));
    expect(actualRobot.chargingStationNotes,
        equals(robotMock.chargingStationNotes));
  });

  test('test fromMap from json file', () {
    // Given
    File robotJsonFile = File('test_resources/pit_scouting.json');
    String actualJson = robotJsonFile.readAsStringSync();
    Map<String, dynamic> actualMap = jsonDecode(actualJson);

    // When
    PitScouting actualRobot = PitScouting.fromMap(actualMap);

    // Then
    expect(actualRobot.teamNumber, equals(robotMock.teamNumber));
    expect(actualRobot.scoutName, equals(robotMock.scoutName));
    expect(actualRobot.driverExperience, equals(robotMock.driverExperience));
    expect(actualRobot.weight, equals(robotMock.weight));
    expect(actualRobot.width, equals(robotMock.width));
    expect(actualRobot.length, equals(robotMock.length));
    expect(actualRobot.driveBaseType, equals(robotMock.driveBaseType));
    expect(actualRobot.stable, equals(robotMock.stable));
    expect(actualRobot.canIntakeCone, equals(robotMock.canIntakeCone));
    expect(actualRobot.canIntakeCube, equals(robotMock.canIntakeCube));
    // expect to be equal ignoring order
    expect(actualRobot.pickupSpotsCube.toSet(),
        equals(robotMock.pickupSpotsCube.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.pickupSpotsCone.toSet(),
        equals(robotMock.pickupSpotsCone.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    expect(actualRobot.gamePiecesNotes, equals(robotMock.gamePiecesNotes));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCube.toSet(),
        equals(robotMock.gridScoringLevelsCube.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCone.toSet(),
        equals(robotMock.gridScoringLevelsCone.toSet()));
    expect(actualRobot.scoringNotes, equals(robotMock.scoringNotes));
    expect(actualRobot.chargingStationNotes,
        equals(robotMock.chargingStationNotes));
  });

  test('test toJson', () {
    // Given
    File robotJsonFile = File('test_resources/pit_scouting.json');
    String expectedRobotJsonString = robotJsonFile.readAsStringSync();
    Map<String, dynamic> expectedRobotJson =
        jsonDecode(expectedRobotJsonString);

    // When
    Map<String, dynamic> actualRobotJson = jsonDecode(robotMock.toJson());

    // Then
    expect(
        actualRobotJson['teamNumber'], equals(expectedRobotJson['teamNumber']));
    expect(
        actualRobotJson['scoutName'], equals(expectedRobotJson['scoutName']));
    expect(actualRobotJson['driverExperience'],
        equals(expectedRobotJson['driverExperience']));
    expect(actualRobotJson['weight'], equals(expectedRobotJson['weight']));
    expect(actualRobotJson['width'], equals(expectedRobotJson['width']));
    expect(actualRobotJson['length'], equals(expectedRobotJson['length']));
    expect(actualRobotJson['driveBaseType'],
        equals(expectedRobotJson['driveBaseType']));
    expect(actualRobotJson['stable'], equals(expectedRobotJson['stable']));
    expect(actualRobotJson['canIntakeCone'],
        equals(expectedRobotJson['canIntakeCone']));
    expect(actualRobotJson['canIntakeCube'],
        equals(expectedRobotJson['canIntakeCube']));
    // expect to be equal ignoring order
    expect(actualRobotJson['pickupSpotsCube'].toSet(),
        equals(expectedRobotJson['pickupSpotsCube'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['pickupSpotsCone'].toSet(),
        equals(expectedRobotJson['pickupSpotsCone'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['intakeConeOrientations'].toSet(),
        equals(expectedRobotJson['intakeConeOrientations'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['gridScoringLevelsCube'].toSet(),
        equals(expectedRobotJson['gridScoringLevelsCube'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['gridScoringLevelsCone'].toSet(),
        equals(expectedRobotJson['gridScoringLevelsCone'].toSet()));
    expect(actualRobotJson['scoringNotes'],
        equals(expectedRobotJson['scoringNotes']));
    expect(actualRobotJson['chargingStationNotes'],
        equals(expectedRobotJson['chargingStationNotes']));
  });
}

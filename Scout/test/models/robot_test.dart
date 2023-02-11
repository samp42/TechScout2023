import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';
import 'package:scout/models/robot.dart';
import 'package:test/test.dart';

void main() {
  final Robot robotMock = Robot(
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
    pickupSpotsCube: [PickupEnum.floor],
    pickupSpotsCone: [PickupEnum.floor],
    intakeConeOrientations: [
      ConeOrientationEnum.pointingAway,
      ConeOrientationEnum.pointingTowards,
      ConeOrientationEnum.upRight,
      ConeOrientationEnum.sideways,
    ],
    gridScoringLevelsCube: [
      GridLevelEnum.bottom,
      GridLevelEnum.middle,
      GridLevelEnum.top,
    ],
    gridScoringLevelsCone: [
      GridLevelEnum.bottom,
      GridLevelEnum.middle,
      GridLevelEnum.top,
    ],
    gamePiecesNotes: 'The robot can intake but the intake is not very strong.',
    scoringNotes: 'We can only score cubes on the bottom level of the grid.',
    chargingStationNotes:
        'We can only park on the left side of the charging station.',
  );

  test('Test fromMap', () {
    // Given / When
    Robot actualRobot = Robot.fromMap({
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
      'pickupSpotsCube': ['floor'],
      'pickupSpotsCone': ['floor'],
      'intakeConeOrientations': [
        'pointing away',
        'pointing towards',
        'sideways',
        'up right'
      ],
      'gridScoringLevelsCube': ['bottom', 'middle', 'top'],
      'gridScoringLevelsCone': ['bottom', 'middle', 'top'],
      'gamePiecesNotes':
          'The robot can intake but the intake is not very strong.',
      'scoringNotes':
          'We can only score cubes on the bottom level of the grid.',
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
    expect(actualRobot.pickupSpotsCone.toSet(),
        equals(robotMock.pickupSpotsCone.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCube.toSet(),
        equals(robotMock.gridScoringLevelsCube.toSet()));
    expect(actualRobot.gridScoringLevelsCone.toSet(),
        equals(robotMock.gridScoringLevelsCone.toSet()));
    expect(actualRobot.gamePiecesNotes, equals(robotMock.gamePiecesNotes));
    expect(actualRobot.scoringNotes, equals(robotMock.scoringNotes));
    expect(actualRobot.chargingStationNotes,
        equals(robotMock.chargingStationNotes));
  });

  test('test fromMap from json file', () {
    // Given
    File robotJsonFile = File('test_resources/robot.json');
    String actualJson = robotJsonFile.readAsStringSync();
    Map<String, dynamic> actualMap = jsonDecode(actualJson);

    // When
    Robot actualRobot = Robot.fromMap(actualMap);

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
    expect(actualRobot.pickupSpotsCone.toSet(),
        equals(robotMock.pickupSpotsCone.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevelsCube.toSet(),
        equals(robotMock.gridScoringLevelsCube.toSet()));
    expect(actualRobot.gridScoringLevelsCone.toSet(),
        equals(robotMock.gridScoringLevelsCone.toSet()));
    expect(actualRobot.gamePiecesNotes, equals(robotMock.gamePiecesNotes));
    expect(actualRobot.scoringNotes, equals(robotMock.scoringNotes));
    expect(actualRobot.chargingStationNotes,
        equals(robotMock.chargingStationNotes));
  });

  test('Test toJson', () {
    // Given
    File robotJsonFile = File('test_resources/robot.json');
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
    expect(actualRobotJson['pickupSpotsCone'].toSet(),
        equals(expectedRobotJson['pickupSpotsCone'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['intakeConeOrientations'].toSet(),
        equals(expectedRobotJson['intakeConeOrientations'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['gridScoringLevelsCube'].toSet(),
        equals(expectedRobotJson['gridScoringLevelsCube'].toSet()));
    expect(actualRobotJson['gridScoringLevelsCone'].toSet(),
        equals(expectedRobotJson['gridScoringLevelsCone'].toSet()));
    expect(actualRobotJson['gamePiecesNotes'],
        equals(expectedRobotJson['gamePiecesNotes']));
    expect(actualRobotJson['scoringNotes'],
        equals(expectedRobotJson['scoringNotes']));
    expect(actualRobotJson['chargingStationNotes'],
        equals(expectedRobotJson['chargingStationNotes']));
  });
}

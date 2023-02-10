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
    pickupSpots: [PickupEnum.floor],
    intakeConeOrientations: [
      ConeOrientationEnum.pointingAway,
      ConeOrientationEnum.pointingTowards,
      ConeOrientationEnum.upRight,
      ConeOrientationEnum.sideways,
    ],
    gridScoringLevels: [
      GridLevelEnum.bottom,
      GridLevelEnum.middle,
      GridLevelEnum.top,
    ],
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
      'pickupSpots': ['floor'],
      'intakeConeOrientations': [
        'pointing away',
        'pointing towards',
        'sideways',
        'up right'
      ],
      'gridScoringLevels': ['bottom', 'middle', 'top'],
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
    expect(
        actualRobot.pickupSpots.toSet(), equals(robotMock.pickupSpots.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevels.toSet(),
        equals(robotMock.gridScoringLevels.toSet()));
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
    expect(
        actualRobot.pickupSpots.toSet(), equals(robotMock.pickupSpots.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(),
        equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevels.toSet(),
        equals(robotMock.gridScoringLevels.toSet()));
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
    expect(actualRobotJson['pickupSpots'].toSet(),
        equals(expectedRobotJson['pickupSpots'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['intakeConeOrientations'].toSet(),
        equals(expectedRobotJson['intakeConeOrientations'].toSet()));
    // expect to be equal ignoring order
    expect(actualRobotJson['gridScoringLevels'].toSet(),
        equals(expectedRobotJson['gridScoringLevels'].toSet()));
    expect(actualRobotJson['scoringNotes'],
        equals(expectedRobotJson['scoringNotes']));
    expect(actualRobotJson['chargingStationNotes'],
        equals(expectedRobotJson['chargingStationNotes']));
  });
}

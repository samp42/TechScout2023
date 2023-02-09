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
      'driveBaseType': 'Tank',
      'stable': false,
      'canIntakeCone': true,
      'canIntakeCube': true,
      'pickupSpots': [
        'floor'
      ],
      'intakeConeOrientations': [
        'Pointing Away',
        'Pointing Towards',
        'Sideways',
        'Up Right'
      ],
      'gridScoringLevels': [
        'Bottom',
        'Middle',
        'Top'
      ]
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
    expect(actualRobot.pickupSpots.toSet(), equals(robotMock.pickupSpots.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(), equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevels.toSet(), equals(robotMock.gridScoringLevels.toSet()));
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
    expect(actualRobot.pickupSpots.toSet(), equals(robotMock.pickupSpots.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.intakeConeOrientations.toSet(), equals(robotMock.intakeConeOrientations.toSet()));
    // expect to be equal ignoring order
    expect(actualRobot.gridScoringLevels.toSet(), equals(robotMock.gridScoringLevels.toSet()));
  });

  test('Test toJson', () {
    // Given
    File robotJsonFile = File('test_resources/robot.json');
    String expectedRobotJson = robotJsonFile.readAsStringSync();

    // When
    File actualRobotFile = robotMock.toJson();
    String actualRobotJson = actualRobotFile.readAsStringSync();

    // Then
    expect(actualRobotJson, equals(expectedRobotJson));
  });

}

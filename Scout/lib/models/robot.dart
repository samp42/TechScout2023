import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';

class Robot {
  int teamNumber;
  String scoutName;

  // team info
  DriverExperienceEnum driverExperience;

  // robot info
  int weight;
  int width;
  int length;
  DriveBaseTypeEnum driveBaseType;
  bool stable;

  // game pieces
  bool canIntakeCone;
  bool canIntakeCube;
  List<PickupEnum> pickupSpots;
  List<ConeOrientationEnum> intakeConeOrientations;

  // scoring
  List<GridLevelEnum> gridScoringLevels;

  Robot({
    required this.teamNumber,
    required this.scoutName,
    required this.driverExperience,
    required this.weight,
    required this.width,
    required this.length,
    required this.driveBaseType,
    required this.stable,
    required this.canIntakeCone,
    required this.canIntakeCube,
    required this.pickupSpots,
    required this.intakeConeOrientations,
    required this.gridScoringLevels
  });


  Robot.fromMap(Map<String, dynamic> map)
      : teamNumber = map['teamNumber'],
        scoutName = map['scoutName'],
        driverExperience = DriverExperienceEnumExtension.fromValue(map['driverExperience']),
        weight = map['weight'],
        width = map['width'],
        length = map['length'],
        driveBaseType = DriveBaseTypeEnumExtension.fromName(map['driveBaseType']),
        stable = map['stable'],
        canIntakeCone = map['canIntakeCone'],
        canIntakeCube = map['canIntakeCube'],
        pickupSpots = map['pickupSpots']
            .map<PickupEnum>(
                (e) => PickupEnumExtension.fromValue(e))
            .toList(),
        intakeConeOrientations = map['intakeConeOrientations']
            .map<ConeOrientationEnum>(
                (e) => ConeOrientationEnumExtension.fromName(e))
            .toList(),
        gridScoringLevels = map['gridScoringLevels']
            .map<GridLevelEnum>(
                (e) => GridLevelEnumExtension.fromValue(e))
            .toList();

  String toJson() {
    return jsonEncode(this);
  }
  
  File toFile({String? path = '', required String name}) {
    File file = File('$path/$name');
    file.writeAsString(toJson());

    return file;
  }
}

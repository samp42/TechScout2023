import 'dart:convert';

import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';

class PitScouting {
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
  String scoringNotes;

  // charging stations
  String chargingStationNotes;

  PitScouting(
      {required this.teamNumber,
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
      required this.gridScoringLevels,
      required this.scoringNotes,
      required this.chargingStationNotes});

  PitScouting.fromMap(Map<String, dynamic> map)
      : teamNumber = map['teamNumber'],
        scoutName = map['scoutName'],
        driverExperience =
            DriverExperienceEnumExtension.fromValue(map['driverExperience']),
        weight = map['weight'],
        width = map['width'],
        length = map['length'],
        driveBaseType =
            DriveBaseTypeEnumExtension.fromValue(map['driveBaseType']),
        stable = map['stable'],
        canIntakeCone = map['canIntakeCone'],
        canIntakeCube = map['canIntakeCube'],
        pickupSpots = map['pickupSpots']
            .map<PickupEnum>((e) => PickupEnumExtension.fromValue(e))
            .toList(),
        intakeConeOrientations = map['intakeConeOrientations']
            .map<ConeOrientationEnum>(
                (e) => ConeOrientationEnumExtension.fromValue(e))
            .toList(),
        gridScoringLevels = map['gridScoringLevels']
            .map<GridLevelEnum>((e) => GridLevelEnumExtension.fromValue(e))
            .toList(),
        scoringNotes = map['scoringNotes'],
        chargingStationNotes = map['chargingStationNotes'];

  Map<String, dynamic> _toMap() {
    return {
      'teamNumber': teamNumber,
      'scoutName': scoutName,
      'driverExperience': driverExperience.value,
      'weight': weight,
      'width': width,
      'length': length,
      'driveBaseType': driveBaseType.value,
      'stable': stable,
      'canIntakeCone': canIntakeCone,
      'canIntakeCube': canIntakeCube,
      'pickupSpots': pickupSpots.map((e) => e.value).toList(),
      'intakeConeOrientations':
          intakeConeOrientations.map((e) => e.value).toList(),
      'gridScoringLevels': gridScoringLevels.map((e) => e.value).toList(),
      'scoringNotes': scoringNotes,
      'chargingStationNotes': chargingStationNotes,
    };
  }

  String toJson() {
    return jsonEncode(_toMap());
  }
}

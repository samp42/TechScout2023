import 'dart:convert';

import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';

class PitScouting {
  late int teamNumber;
  late String scoutName;

  // team info
  late DriverExperienceEnum driverExperience;

  // robot info
  late int weight;
  late int width;
  late int length;
  late DriveBaseTypeEnum driveBaseType;
  late bool stable;
  late bool haveSeparatedIntake;

  // game pieces
  late bool canIntakeCone;
  late bool canIntakeCube;
  late PickupEnum pickupSpots;
  late List<ConeOrientationEnum> intakeConeOrientations;

  // scoring
  late List<GridLevelEnum> gridScoringLevels;
  late String scoringNotes;

  // charging stations
  late String chargingStationNotes;

  PitScouting.empty();
  PitScouting.full(
      {required this.teamNumber,
      required this.scoutName,
      required this.driverExperience,
      required this.weight,
      required this.width,
      required this.length,
      required this.driveBaseType,
      required this.stable,
      required this.haveSeparatedIntake,
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
        haveSeparatedIntake = map['haveSparatedIntake'],
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
      'haveSparatedIntake': haveSeparatedIntake,
      'canIntakeCone': canIntakeCone,
      'canIntakeCube': canIntakeCube,
      'pickupSpots': pickupSpots.value,
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

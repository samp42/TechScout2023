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
  late List<PickupEnum> pickupSpotsCube;
  late List<PickupEnum> pickupSpotsCone;
  late List<ConeOrientationEnum> intakeConeOrientations;
  late String gamePiecesNotes;

  // scoring
  late List<GridLevelEnum> gridScoringLevelsCube;
  late List<GridLevelEnum> gridScoringLevelsCone;
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
      required this.pickupSpotsCube,
      required this.pickupSpotsCone,
      required this.intakeConeOrientations,
      required this.gamePiecesNotes,
      required this.gridScoringLevelsCube,
      required this.gridScoringLevelsCone,
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
        pickupSpotsCube = map['pickupSpotsCube'] = map['pickupSpotsCube']
            .map<PickupEnum>((e) => PickupEnumExtension.fromValue(e))
            .toList(),
        pickupSpotsCone = map['pickupSpotsCone'] = map['pickupSpotsCone']
            .map<PickupEnum>((e) => PickupEnumExtension.fromValue(e))
            .toList(),
        intakeConeOrientations = map['intakeConeOrientations']
            .map<ConeOrientationEnum>(
                (e) => ConeOrientationEnumExtension.fromValue(e))
            .toList(),
        gamePiecesNotes = map['gamePiecesNotes'],
        gridScoringLevelsCube = map['gridScoringLevelsCube']
            .map<GridLevelEnum>((e) => GridLevelEnumExtension.fromValue(e))
            .toList(),
        gridScoringLevelsCone = map['gridScoringLevelsCone']
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
      'pickupSpotsCube': pickupSpotsCube.map((e) => e.value).toList(),
      'pickupSpotsCone': pickupSpotsCone.map((e) => e.value).toList(),
      'intakeConeOrientations':
          intakeConeOrientations.map((e) => e.value).toList(),
      'gridScoringLevelsCube':
          gridScoringLevelsCube.map((e) => e.value).toList(),
      'gridScoringLevelsCone':
          gridScoringLevelsCone.map((e) => e.value).toList(),
      'gamePiecesNotes': gamePiecesNotes,
      'scoringNotes': scoringNotes,
      'chargingStationNotes': chargingStationNotes,
    };
  }

  String toJson() {
    return jsonEncode(_toMap());
  }
}

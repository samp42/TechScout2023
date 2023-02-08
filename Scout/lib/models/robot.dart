import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';

class Robot {
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

  // game pieces
  late bool canIntakeCone;
  late bool canIntakeCube;
}

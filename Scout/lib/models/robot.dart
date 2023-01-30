import 'package:realm/realm.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';

part 'robot.g.dart';

@RealmModel()
class _Robot {
  @PrimaryKey()
  late final int teamNumber;

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

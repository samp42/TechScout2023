import 'package:realm/realm.dart';

part 'robot.g.dart';

@RealmModel()
class _Robot {
  @PrimaryKey()
  late final int teamNumber;

  late String scoutName;
}

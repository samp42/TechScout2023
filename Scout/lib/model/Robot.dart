import 'package:realm/realm.dart';

part 'Robot.g.dart';

@RealmModel()
class _Robot {
  @PrimaryKey()
  late final int teamNumber;

  late String scoutName;

}

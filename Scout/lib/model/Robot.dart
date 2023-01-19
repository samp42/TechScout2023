import 'package:realm/realm.dart';

@RealmModel()
class _Robot {
  @PrimaryKey()
  late final int teamNumber;
  late String scoutName;

}

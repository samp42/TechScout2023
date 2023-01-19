// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Robot extends _Robot with RealmEntity, RealmObjectBase, RealmObject {
  Robot(
    int teamNumber,
    String scoutName,
  ) {
    RealmObjectBase.set(this, 'teamNumber', teamNumber);
    RealmObjectBase.set(this, 'scoutName', scoutName);
  }

  Robot._();

  @override
  int get teamNumber => RealmObjectBase.get<int>(this, 'teamNumber') as int;
  @override
  set teamNumber(int value) => throw RealmUnsupportedSetError();

  @override
  String get scoutName =>
      RealmObjectBase.get<String>(this, 'scoutName') as String;
  @override
  set scoutName(String value) => RealmObjectBase.set(this, 'scoutName', value);

  @override
  Stream<RealmObjectChanges<Robot>> get changes =>
      RealmObjectBase.getChanges<Robot>(this);

  @override
  Robot freeze() => RealmObjectBase.freezeObject<Robot>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Robot._);
    return const SchemaObject(ObjectType.realmObject, Robot, 'Robot', [
      SchemaProperty('teamNumber', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('scoutName', RealmPropertyType.string),
    ]);
  }
}

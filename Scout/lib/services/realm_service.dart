import 'package:realm/realm.dart';

class RealmService {
  // singleton
  static RealmService? _instance;

  static RealmService get instance {
    _instance ??= RealmService._();
    return _instance!;
  }

  static Configuration? _configuration;

  RealmService._();

  Realm? _realm;

  Future<Realm> get realm async {
    // if (_realm == null) {
    //   _realm = await Realm.open();
    // }
    // return _realm!;

    return _realm ??= await Realm.open(_configuration!);
  }
}

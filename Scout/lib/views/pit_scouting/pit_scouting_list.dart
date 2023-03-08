import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scout/services/persistence_service.dart';

// ignore: must_be_immutable
class PitScoutingList extends StatelessWidget {
  final PersistenceService storage;
  PitScoutingList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAppDirectory();
    return Text('$_appStorageDirectory');
  }

  late Future<Directory> _appStorageDirectory;
  void getAppDirectory() async {
    _appStorageDirectory = getApplicationDocumentsDirectory();
  }
}
/*ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
            }));*/

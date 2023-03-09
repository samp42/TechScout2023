import 'package:flutter/material.dart';
import 'package:scout/services/persistence_service.dart';

class PitScoutingList extends StatelessWidget {
  final PersistenceService storage;
  const PitScoutingList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getAppDirectory();
    return const Center(
      child: Text('Pit Scouting List'),
    );
  }

  // late Directory _appStorageDirectory;
  // late String path;
  // void getAppDirectory() async {
  //   _appStorageDirectory = await getApplicationDocumentsDirectory();
  //   path = _appStorageDirectory.path;
  // }
}
/*ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
            }));*/

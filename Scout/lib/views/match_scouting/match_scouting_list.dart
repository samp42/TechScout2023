import 'package:flutter/material.dart';
import 'package:scout/services/persistence_service.dart';

class MatchScoutingList extends StatelessWidget {
  final PersistenceService persistenceService = PersistenceService();

  MatchScoutingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // child: ListView(
        //     children: persistenceService
        //         .readMatches()
        //         .map<Widget>((e) => Text(e.matchNumber.toString()))
        //         .toList()),
        child: Text('Match Scouting List'),
      ),
    );
  }
}

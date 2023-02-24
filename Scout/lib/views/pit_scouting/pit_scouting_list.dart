import 'package:flutter/material.dart';

import '../../models/pit_scouting.dart';

class PitScoutingList extends StatelessWidget {
  final List<PitScouting> list;
  const PitScoutingList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(list[0].canIntakeCone.toString())));
  }
}
/*ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
            }));*/

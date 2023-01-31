import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class MatchScoutingEntry extends StatelessWidget {
  const MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Match Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: const Center(
        child: Text('Match Scouting Entry'),
      ),
    );
  }
}

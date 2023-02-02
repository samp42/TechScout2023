import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class PitScoutingEntry extends StatelessWidget {
  const PitScoutingEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Pit Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: const Center(
        child: Text('Pit Scouting Entry'),
      ),
    );
  }
}

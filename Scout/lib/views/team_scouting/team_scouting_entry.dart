import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class TeamScouting extends StatelessWidget {
  const TeamScouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Practice Field Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: const Center(
        child: Text('Team Scouting Entry'),
      ),
    );
  }
}

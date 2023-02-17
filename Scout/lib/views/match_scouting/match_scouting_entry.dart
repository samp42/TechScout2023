import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_information_step.dart';
import 'package:scout/views/match_scouting/match_team_form.dart';

class MatchScoutingEntry extends StatefulWidget {
  const MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  State<MatchScoutingEntry> createState() => _MatchScoutingEntryState();
}

class _MatchScoutingEntryState extends State<MatchScoutingEntry> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Match Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(start: 40),
        child: Stepper(
          steps: const [
            Step(
              title: Text('Match Information'),
              content: MatchInformationStep(),
            ),
            Step(
              title: Text('Teams'),
              content: Text('World'),
            ),
            Step(
              title: Text('Teleop'),
              content: Text('Hello'),
            ),
            Step(
              title: Text('Results'),
              content: Text('World'),
            ),
          ],
        ),
      ),
    );
  }
}

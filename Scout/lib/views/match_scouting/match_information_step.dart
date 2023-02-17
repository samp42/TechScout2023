import 'package:flutter/material.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_team_field.dart';

class MatchInformationStep extends StatefulWidget {
  const MatchInformationStep({Key? key}) : super(key: key);

  @override
  _MatchInformationStepState createState() => _MatchInformationStepState();
}

class _MatchInformationStepState extends State<MatchInformationStep> {
  late TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
        decoration: BoxDecoration(
          color: redSecondary,
          border: Border.all(color: redSecondary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            MatchTeamField(label: "Red 1"),
            MatchTeamField(label: "Red 2"),
            MatchTeamField(label: "Red 3"),
          ],
        ));
  }
}

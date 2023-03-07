import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/models/validator_callback.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_team_field.dart';

class MatchTeamsForm extends StatefulWidget {
  final ValidatorCallback onChanged;
  MatchScouting matchScouting;

  MatchTeamsForm({
    Key? key,
    required this.onChanged,
    required this.matchScouting,
  }) : super(key: key);

  @override
  MatchTeamsFormState createState() => MatchTeamsFormState();
}

class MatchTeamsFormState extends State<MatchTeamsForm> {
  final radius = const Radius.circular(12);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              decoration: BoxDecoration(
                color: redSecondary,
                border: Border.all(color: redSecondary),
                borderRadius: BorderRadius.only(
                  topLeft: radius,
                  bottomLeft: radius,
                ),
              ),
              child: Column(
                children: [
                  MatchTeamField(
                    label: "${AllianceEnum.red.capitalisedValue} 1",
                    color: redPrimary,
                    onChanged: (value) {
                      widget.onChanged(value);
                      widget.matchScouting.redTeams[0] = int.parse(value!);
                    },
                  ),
                  MatchTeamField(
                    label: "${AllianceEnum.red.capitalisedValue} 2",
                    color: redPrimary,
                    onChanged: (value) {
                      widget.matchScouting.redTeams[1] = int.parse(value!);
                      widget.onChanged(value);
                    },
                  ),
                  MatchTeamField(
                    label: "${AllianceEnum.red.capitalisedValue} 3",
                    color: redPrimary,
                    onChanged: (value) {
                      widget.matchScouting.redTeams[2] = int.parse(value!);
                      widget.onChanged(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              decoration: BoxDecoration(
                color: blueSecondary,
                border: Border.all(color: blueSecondary),
                borderRadius: BorderRadius.only(
                  topRight: radius,
                  bottomRight: radius,
                ),
              ),
              child: Column(
                children: [
                  MatchTeamField(
                    label: "${AllianceEnum.blue.capitalisedValue} 1",
                    color: bluePrimary,
                    onChanged: (value) {
                      widget.matchScouting.blueTeams[0] = int.parse(value!);
                      widget.onChanged(value);
                    },
                  ),
                  MatchTeamField(
                    label: "${AllianceEnum.blue.capitalisedValue} 2",
                    color: bluePrimary,
                    onChanged: (value) {
                      widget.matchScouting.blueTeams[1] = int.parse(value!);
                      widget.onChanged(value);
                    },
                  ),
                  MatchTeamField(
                    label: "${AllianceEnum.blue.capitalisedValue} 3",
                    color: bluePrimary,
                    onChanged: (value) {
                      widget.matchScouting.blueTeams[2] = int.parse(value!);
                      widget.onChanged(value);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

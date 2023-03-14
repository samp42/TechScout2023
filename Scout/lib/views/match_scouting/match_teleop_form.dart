import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/teleop_form_column.dart';

class MatchTeleopForm extends StatefulWidget {
  final MatchScouting matchScouting;

  const MatchTeleopForm({
    Key? key,
    required this.matchScouting,
  }) : super(key: key);

  @override
  MatchTeleopFormState createState() => MatchTeleopFormState();
}

class MatchTeleopFormState extends State<MatchTeleopForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: redSecondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  bottomLeft: Radius.circular(kBorderRadius),
                ),
              ),
              child: TeleopFormColumn(
                alliance: AllianceEnum.red,
                matchScouting: widget.matchScouting,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: blueSecondary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(kBorderRadius),
                  bottomRight: Radius.circular(kBorderRadius),
                ),
              ),
              child: TeleopFormColumn(
                alliance: AllianceEnum.blue,
                matchScouting: widget.matchScouting,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

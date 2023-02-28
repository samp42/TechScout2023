import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_team_field.dart';

class MatchInformationStep extends StatefulWidget {
  final AllianceEnum alliance;

  const MatchInformationStep({Key? key, required this.alliance})
      : super(key: key);

  @override
  MatchInformationStepState createState() => MatchInformationStepState();
}

class MatchInformationStepState extends State<MatchInformationStep> {
  Color get _primary =>
      widget.alliance == AllianceEnum.red ? redPrimary : bluePrimary;

  Color get _secondary =>
      widget.alliance == AllianceEnum.red ? redSecondary : blueSecondary;

  BorderRadius get _borderRadius => BorderRadius.only(
      topLeft: Radius.circular(
          widget.alliance == AllianceEnum.red ? kBorderRadius : 0),
      topRight: Radius.circular(
          widget.alliance == AllianceEnum.red ? 0 : kBorderRadius),
      bottomLeft: Radius.circular(
          widget.alliance == AllianceEnum.red ? kBorderRadius : 0),
      bottomRight: Radius.circular(
          widget.alliance == AllianceEnum.red ? 0 : kBorderRadius));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: _secondary,
        border: Border.all(color: _secondary),
        borderRadius: _borderRadius,
      ),
      child: Column(
        children: [
          MatchTeamField(label: "${widget.alliance.value} 1", color: _primary),
          MatchTeamField(label: "${widget.alliance.value} 2", color: _primary),
          MatchTeamField(label: "${widget.alliance.value} 3", color: _primary),
        ],
      ),
    );
  }
}
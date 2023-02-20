import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_team_field.dart';

class MatchInformationStep extends StatefulWidget {
  final AllianceEnum allianceEnum;

  const MatchInformationStep({Key? key, required this.allianceEnum})
      : super(key: key);

  @override
  _MatchInformationStepState createState() => _MatchInformationStepState();
}

class _MatchInformationStepState extends State<MatchInformationStep> {
  late TextEditingController? _controller;
  final double kBorderRadius = 12;

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

  Color get _primary =>
      widget.allianceEnum == AllianceEnum.red ? redPrimary : bluePrimary;

  Color get _secondary =>
      widget.allianceEnum == AllianceEnum.red ? redSecondary : blueSecondary;

  BorderRadius get _borderRadius => BorderRadius.only(
      topLeft: Radius.circular(
          widget.allianceEnum == AllianceEnum.red ? kBorderRadius : 0),
      topRight: Radius.circular(
          widget.allianceEnum == AllianceEnum.red ? 0 : kBorderRadius),
      bottomLeft: Radius.circular(
          widget.allianceEnum == AllianceEnum.red ? kBorderRadius : 0),
      bottomRight: Radius.circular(
          widget.allianceEnum == AllianceEnum.red ? 0 : kBorderRadius));

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
            MatchTeamField(
                label: "${widget.allianceEnum.value} 1", color: _primary),
            MatchTeamField(
                label: "${widget.allianceEnum.value} 2", color: _primary),
            MatchTeamField(
                label: "${widget.allianceEnum.value} 3", color: _primary),
          ],
        ));
  }
}

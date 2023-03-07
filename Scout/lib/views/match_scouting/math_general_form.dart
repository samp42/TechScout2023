import 'package:flutter/material.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/models/validator_callback.dart';

class MatchGeneralForm extends StatefulWidget {
  final ValidatorCallback onChanged;
  final MatchScouting matchScouting;

  const MatchGeneralForm({
    Key? key,
    required this.onChanged,
    required this.matchScouting,
  }) : super(key: key);

  @override
  MatchGeneralFormState createState() => MatchGeneralFormState();
}

class MatchGeneralFormState extends State<MatchGeneralForm> {
  final double kTextFieldWidth = 300;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 1,
              child: Text('Match Number:'),
            ),
            SizedBox(
              width: kTextFieldWidth,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Match Number',
                ),
                onChanged: (value) {
                  widget.matchScouting.matchNumber = int.parse(value);
                  widget.onChanged(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 1,
              child: Text('Scout Name:'),
            ),
            SizedBox(
              width: kTextFieldWidth,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Scout Name',
                ),
                onChanged: (value) {
                  widget.matchScouting.scoutName = value;
                  widget.onChanged(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

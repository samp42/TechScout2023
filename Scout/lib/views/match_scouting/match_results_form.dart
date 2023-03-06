import 'package:flutter/material.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/models/validator_callback.dart';
import 'package:scout/theme.dart';

class MatchResultsForm extends StatefulWidget {
  final ValidatorCallback onChanged;
  MatchScouting matchScouting;

  MatchResultsForm({
    Key? key,
    required this.onChanged,
    required this.matchScouting,
  }) : super(key: key);

  @override
  MatchResultsFormState createState() => MatchResultsFormState();
}

class MatchResultsFormState extends State<MatchResultsForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                  color: redSecondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius)),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.matchScouting.redScore = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    fillColor: redPrimary,
                    filled: true,
                    // no border
                    border: InputBorder.none,
                    hintText: 'Score',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    constraints: BoxConstraints(maxWidth: 120),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: blueSecondary,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius)),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.matchScouting.blueScore = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    fillColor: bluePrimary,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Score',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    constraints: BoxConstraints(maxWidth: 120),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  color: redSecondary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kBorderRadius)),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    widget.matchScouting.redPenalty = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: redPrimary,
                    filled: true,
                    hintText: 'Red',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    constraints: BoxConstraints(maxWidth: 120),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 240,
              alignment: Alignment.center,
              color: whiteT4K,
              child: const Text(
                'PENALTY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                  color: blueSecondary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(kBorderRadius)),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    widget.matchScouting.bluePenalty = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    fillColor: bluePrimary,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Blue',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    constraints: BoxConstraints(maxWidth: 120),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

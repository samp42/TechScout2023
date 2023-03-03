
import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class MatchResultsForm extends StatefulWidget {
  const MatchResultsForm({Key? key}) : super(key: key);

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
                child: const TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  style: TextStyle(
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
                child: const TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  style: TextStyle(
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
                child: const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
                  style: TextStyle(
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
                child: const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
                  style: TextStyle(
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

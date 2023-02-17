import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class MatchTeamField extends StatelessWidget {
  String label;
  // TextEditingController? controller = TextEditingController();

  MatchTeamField({
    Key? key,
    required this.label,
    // required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: redPrimary,
        border: Border.all(color: redPrimary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: whiteT4K),
          fillColor: bluePrimary,
        ),
        style: const TextStyle(
          color: whiteT4K,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

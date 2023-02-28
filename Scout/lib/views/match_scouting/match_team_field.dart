import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class MatchTeamField extends StatelessWidget {
  final String label;
  final Color color;
  // TextEditingController? controller = TextEditingController();

  const MatchTeamField({Key? key, required this.label, required this.color
      // required this.controller,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child:  TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          constraints: const BoxConstraints(
            maxHeight: 36,
          ),
          labelStyle: const TextStyle(color: whiteT4K),
          fillColor: bluePrimary,
          hintText: label,
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: const TextStyle(
          color: whiteT4K,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

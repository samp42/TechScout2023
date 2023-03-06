import 'package:flutter/material.dart';
import 'package:scout/models/validator_callback.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/validators.dart';

class MatchTeamField extends StatelessWidget {
  final String label;
  final Color color;
  final ValidatorCallback onChanged;

  const MatchTeamField({
    Key? key,
    required this.label,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

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
      child: TextFormField(
        onChanged: (value) {
          onChanged(value);
        },
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

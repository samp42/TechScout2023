import 'package:flutter/material.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/models/validator_callback.dart';

import 'package:scout/views/validators.dart';

class MatchGeneralForm extends StatefulWidget {
  final ValidatorCallback onChanged;
  MatchScouting matchScouting;
  final TextEditingController matchNumberController = TextEditingController();
  final TextEditingController scoutNameController = TextEditingController();

  MatchGeneralForm({
    Key? key,
    required this.onChanged,
    required this.matchScouting,
  }) : super(key: key);

  @override
  MatchGeneralFormState createState() => MatchGeneralFormState();
}

class MatchGeneralFormState extends State<MatchGeneralForm> {
  final double kTextFieldWidth = 300;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                  controller: widget.matchNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Match Number',
                  ),
                  validator: (value) =>
                      numberValidator(value, field: 'match number'),
                  onChanged: (value) {
                    if (!_formKey.currentState!.validate()) {
                      widget.matchScouting.matchNumber = int.parse(value);
                    }
                    widget.onChanged(
                        _formKey.currentState!.validate() ? value : null);
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
                  controller: widget.scoutNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Scout Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a scout name';
                    }
                    // must be only letters
                    RegExp exp = RegExp('^[a-zA-Z]+\$');
                    RegExpMatch? match = exp.firstMatch(value);

                    if (match == null || match.group(0) != value) {
                      return 'Please enter a valid scout name';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    if (!_formKey.currentState!.validate()) {
                      widget.matchScouting.scoutName = value;
                    }
                    widget.onChanged(
                        _formKey.currentState!.validate() ? value : null);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

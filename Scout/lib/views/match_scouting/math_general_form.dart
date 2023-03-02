import 'package:flutter/material.dart';
import 'package:scout/models/validator_callback.dart';

class MatchGeneralForm extends StatefulWidget {
  final ValidatorCallback onSubmit;

  const MatchGeneralForm({
    Key? key,
    required this.onSubmit,
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Match Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a match number';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid match number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    widget.onSubmit(
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
                    widget.onSubmit(
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

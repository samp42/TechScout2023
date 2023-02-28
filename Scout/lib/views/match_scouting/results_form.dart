import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class ResultsFormState extends State<ResultsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: redSecondary,
              border: Border.all(color: redSecondary),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  fillColor: redPrimary,
                  filled: true,
                  // no border
                  border: InputBorder.none,
                  hintText: 'Red',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  constraints: BoxConstraints(
                      maxWidth: 120
                  )
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text('Blue'),
        ),
      ],
    );
  }
}

class ResultsForm extends StatefulWidget {
  const ResultsForm({Key? key}) : super(key: key);

  @override
  ResultsFormState createState() => ResultsFormState();
}

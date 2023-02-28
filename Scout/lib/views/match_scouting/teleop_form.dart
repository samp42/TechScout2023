import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class TeleopForm extends StatefulWidget {
  const TeleopForm({Key? key}) : super(key: key);

  @override
  TeleopFormState createState() => TeleopFormState();
}

class TeleopFormState extends State<TeleopForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            alignment: Alignment.topRight,
            color: redSecondary,
            child: TextFormField(
              decoration: const InputDecoration(
                fillColor: redPrimary,
                border: OutlineInputBorder(),
                hintText: 'Red',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                constraints: BoxConstraints(
                  maxHeight: 54,
                  maxWidth: 120,
                ),
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

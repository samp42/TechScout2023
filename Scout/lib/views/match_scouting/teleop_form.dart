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
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: redSecondary,
                child: Text('Red'),
              )
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: blueSecondary,
                child: Text('Blue'),
              )
          )
        ],
      ),
    );
  }
}

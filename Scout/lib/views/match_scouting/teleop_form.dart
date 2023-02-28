import 'package:flutter/material.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/teleop_form_column.dart';

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
              child: const TeleopFormColumn(
                alliance: AllianceEnum.red,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: blueSecondary,
              child: const TeleopFormColumn(
                alliance: AllianceEnum.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

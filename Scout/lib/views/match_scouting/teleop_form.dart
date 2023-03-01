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
              decoration: const BoxDecoration(
                color: redSecondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  bottomLeft: Radius.circular(kBorderRadius),
                ),
              ),
              child: const TeleopFormColumn(
                alliance: AllianceEnum.red,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: blueSecondary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(kBorderRadius),
                  bottomRight: Radius.circular(kBorderRadius),
                ),
              ),
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

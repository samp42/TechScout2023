import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_information_step.dart';
import 'package:scout/views/match_scouting/match_team_form.dart';
import 'package:scout/views/match_scouting/math_general_form.dart';

class MatchScoutingEntry extends StatefulWidget {
  const MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  State<MatchScoutingEntry> createState() => _MatchScoutingEntryState();
}

class _MatchScoutingEntryState extends State<MatchScoutingEntry> {
  int _index = 0;
  final int numOfSteps = 5;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Match Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(start: 40),
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _index == numOfSteps - 1;
            return Row(children: <Widget>[
              if (_index > 0)
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
                ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child:
                      (isLastStep) ? const Text('Submit') : const Text('Next'),
                ),
              ),
            ]);
          },
          type: StepperType.horizontal,
          elevation: 0,
          steps: [
            const Step(
              title: Text('General Information'),
              content: MatchGeneralForm(),
            ),
            Step(
              title: const Text('Match Information'),
              content: Row(
                children: const [
                  Expanded(
                    child: MatchInformationStep(allianceEnum: AllianceEnum.red),
                  ),
                  Expanded(
                    child:
                        MatchInformationStep(allianceEnum: AllianceEnum.blue),
                  ),
                ],
              ),
            ),
            const Step(
              title: Text('Teams'),
              content: Text('World'),
            ),
            const Step(
              title: Text('Teleop'),
              content: Text('Hello'),
            ),
            const Step(
              title: Text('Results'),
              content: Text('World'),
            ),
          ],
        ),
      ),
    );
  }
}

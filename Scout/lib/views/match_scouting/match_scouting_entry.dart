import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scout/enums/alliance_enum.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/match_information_step.dart';
import 'package:scout/views/match_scouting/math_general_form.dart';
import 'package:scout/views/match_scouting/results_form.dart';
import 'package:scout/views/match_scouting/teleop_form.dart';

class MatchScoutingEntry extends StatefulWidget {
  const MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  State<MatchScoutingEntry> createState() => _MatchScoutingEntryState();
}

class _MatchScoutingEntryState extends State<MatchScoutingEntry> {
  int _index = 0;
  final int numOfSteps = 4;

  MatchScouting matchScouting = MatchScouting();

  bool _isActive(int step) => _index == step;

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
      body: SafeArea(
        child: Stepper(
          // TODO: don't allow user to go to other step if current step is not valid
          // onStepTapped: (int step) {
          //   setState(() {
          //     _index = step;
          //   });
          // },
          currentStep: _index,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _index == numOfSteps - 1;
            return Row(children: [
              if (_index > 0)
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _index--;
                      });
                      details.onStepCancel;
                    },
                    child: const Text('Back'),
                  ),
                ),
              if (_index > 0)
                const SizedBox(
                  width: 10,
                ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    if (_index < numOfSteps - 1) {
                      setState(() {
                        _index++;
                      });
                      details.onStepContinue;
                    } else {
                      // TODO
                      print('submit');
                    }
                  },
                  child:
                      (isLastStep) ? const Text('Submit') : const Text('Next'),
                ),
              ),
            ]);
          },
          type: StepperType.horizontal,
          elevation: 0,
          steps: [
            Step(
              isActive: _isActive(0),
              title: const Text('Match Information'),
              content: const MatchGeneralForm(),
            ),
            Step(
              isActive: _isActive(1),
              title: const Text('Teams'),
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
            Step(
              isActive: _isActive(2),
              title: const Text('Teleop'),
              content: const TeleopForm(),
            ),
            Step(
              isActive: _isActive(3),
              title: const Text('Results'),
              content: const ResultsForm(),
            ),
          ],
        ),
      ),
    );
  }
}

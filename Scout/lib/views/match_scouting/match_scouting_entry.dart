import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/services/persistence_service.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/math_general_form.dart';
import 'package:scout/views/match_scouting/match_teams_form.dart';
import 'package:scout/views/match_scouting/match_teleop_form.dart';
import 'package:scout/views/match_scouting/match_results_form.dart';

class MatchScoutingEntry extends StatefulWidget {
  final PersistenceService persistenceService = PersistenceService();
  final MatchScouting matchScouting = MatchScouting();

  MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  State<MatchScoutingEntry> createState() => MatchScoutingEntryState();
}

class MatchScoutingEntryState extends State<MatchScoutingEntry> {
  final int numOfSteps = 4;
  int _index = 0;

  bool _isActiveStepValid = false;

  MatchScouting matchScouting = MatchScouting();

  bool _isActive(int step) => _index >= step;

  StepState _state(int step) {
    return step < _index ? StepState.complete : StepState.indexed;
  }

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

  void _nextStep() {
    setState(() {
      _index++;
      _isActiveStepValid = false;
    });
  }

  void _validateStep(String? value) {
    if (value != null) {
      setState(() {
        _isActiveStepValid = true;
      });
    }
  }

  void _previousStep() {
    setState(() {
      _index--;
      _isActiveStepValid = true;
    });
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
          currentStep: _index,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _index == numOfSteps - 1;
            return Row(children: [
              if (_index > 0)
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      _previousStep();
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
                      if (_isActiveStepValid) {
                        _nextStep();
                        details.onStepContinue;
                      }
                    } else {
                      widget.persistenceService.writeMatch(matchScouting);
                      Navigator.pop(context);
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
              state: _state(0),
              isActive: _isActive(0),
              title: const Text('Match Information'),
              content: MatchGeneralForm(
                onChanged: (value) {
                  _validateStep(value);
                },
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(1),
              isActive: _isActive(1),
              title: const Text('Teams'),
              content: MatchTeamsForm(
                onChanged: (value) => _validateStep(value),
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(2),
              isActive: _isActive(2),
              title: const Text('Teleop'),
              content: MatchTeleopForm(
                onChanged: (value) => _validateStep(value),
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(3),
              isActive: _isActive(3),
              title: const Text('Results'),
              content: MatchResultsForm(
                onChanged: (value) => _validateStep(value),
                matchScouting: matchScouting,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

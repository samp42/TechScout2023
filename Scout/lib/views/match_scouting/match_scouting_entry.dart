import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scout/models/match_scouting.dart';
import 'package:scout/services/persistence_service.dart';
import 'package:scout/theme.dart';
import 'package:scout/views/match_scouting/math_general_form.dart';
import 'package:scout/views/match_scouting/match_teams_form.dart';
import 'package:scout/views/match_scouting/match_teleop_form.dart';
import 'package:scout/views/match_scouting/match_results_form.dart';

class MatchScoutingEntry extends StatefulWidget {
  final PersistenceService persistenceService = PersistenceService();

  MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  State<MatchScoutingEntry> createState() => MatchScoutingEntryState();
}

class MatchScoutingEntryState extends State<MatchScoutingEntry> {
  final int numOfSteps = 6;
  int _index = 0;

  MatchScouting matchScouting = MatchScouting.entry();

  bool _isActive(int step) => _index >= step;

  StepState _state(int step) {
    return step < _index ? StepState.complete : StepState.indexed;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    matchScouting = MatchScouting.entry();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void _nextStep() {
    setState(() {
      _index++;
    });
  }

  void _previousStep() {
    setState(() {
      _index--;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Center(
          child: Text(message),
        ),
      ),
    );
  }

  bool _teamsFormValid() {
    return matchScouting.redTeams[0] != 0 &&
        int.tryParse(matchScouting.redTeams[0].toString()) != null &&
        matchScouting.redTeams[1] != 0 &&
        int.tryParse(matchScouting.redTeams[1].toString()) != null &&
        matchScouting.redTeams[2] != 0 &&
        int.tryParse(matchScouting.redTeams[2].toString()) != null &&
        matchScouting.blueTeams[0] != 0 &&
        int.tryParse(matchScouting.blueTeams[0].toString()) != null &&
        matchScouting.blueTeams[1] != 0 &&
        int.tryParse(matchScouting.blueTeams[1].toString()) != null &&
        matchScouting.blueTeams[2] != 0 &&
        int.tryParse(matchScouting.blueTeams[2].toString()) != null;
  }

  bool _resultsFormValid() {
    return matchScouting.redScore != null &&
        int.tryParse(matchScouting.redScore.toString()) != null &&
        matchScouting.blueScore != null &&
        int.tryParse(matchScouting.blueScore.toString()) != null &&
        matchScouting.redPenalty != null &&
        int.tryParse(matchScouting.redPenalty.toString()) != null &&
        matchScouting.bluePenalty != null &&
        int.tryParse(matchScouting.bluePenalty.toString()) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_index == numOfSteps - 1 ? 0 : 56),
        child: AppBar(
          backgroundColor: materialBlackT4K,
          title: const Text(
            'New Match Scouting Entry',
            style: TextStyle(color: yellowT4K),
          ),
        ),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: _index,
          onStepTapped: (value) {
            if (value < numOfSteps - 1) {
              setState(() {
                _index = value;
              });
            }
          },
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
                    if (_index < numOfSteps - 2) {
                      _nextStep();
                      details.onStepContinue;
                    } else if (_index == numOfSteps - 2) {
                      if (matchScouting.matchNumber == null ||
                          int.tryParse(matchScouting.matchNumber!.toString()) ==
                              null ||
                          matchScouting.matchNumber!.toString().isEmpty) {
                        _showSnackBar('Please enter a valid match number');
                      } else if (matchScouting.scoutName == null ||
                          matchScouting.scoutName!.isEmpty) {
                        _showSnackBar('Please enter a valid scout name');
                      } else if (!_teamsFormValid()) {
                        _showSnackBar('Please enter valid team numbers');
                      } else if (!_resultsFormValid()) {
                        _showSnackBar('Please enter valid results');
                      } else {
                        _nextStep();
                        details.onStepContinue;
                      }
                    } else {
                      widget.persistenceService.writeMatch(matchScouting);
                      Navigator.pop(context, matchScouting);
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
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(1),
              isActive: _isActive(1),
              title: const Text('Teams'),
              content: MatchTeamsForm(
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(2),
              isActive: _isActive(2),
              title: const Text('Teleop'),
              content: MatchTeleopForm(
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(3),
              isActive: _isActive(3),
              title: const Text('Results'),
              content: MatchResultsForm(
                matchScouting: matchScouting,
              ),
            ),
            Step(
              state: _state(4),
              isActive: _isActive(4),
              title: const Text('Validation'),
              content: const Center(
                child: Text('Click Next to Validate'),
              ),
            ),
            Step(
              state: _state(5),
              isActive: _isActive(5),
              title: const Text('QR Code'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Q ${matchScouting.matchNumber.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: QrImage(
                      data: _index == numOfSteps - 1
                          ? matchScouting.toJson().toString()
                          : '',
                      version: QrVersions.auto,
                      size: 240,
                      gapless: false,
                      embeddedImage: const AssetImage(
                          'assets/images/T4K_RGB_round[colour]_transparent.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: const Size(40, 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

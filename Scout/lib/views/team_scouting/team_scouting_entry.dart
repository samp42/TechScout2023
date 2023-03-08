import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scout/models/team_scouting.dart';
import 'package:scout/theme.dart';

class TeamScoutingEntry extends StatefulWidget {
  const TeamScoutingEntry({Key? key}) : super(key: key);

  @override
  TeamScoutingEntryState createState() => TeamScoutingEntryState();
}

class TeamScoutingEntryState extends State<TeamScoutingEntry> {
  TeamScouting teamScouting = TeamScouting.entry();

  int _index = 0;

  bool _isActive(int step) => _index >= step;

  StepState _state(int step) {
    return step < _index ? StepState.complete : StepState.indexed;
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
          'New Team Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: _index,
          type: StepperType.horizontal,
          elevation: 0,
          controlsBuilder: (context, details) {
            final isLastStep = _index == 3;
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
                    if (_index < 3) {
                      _nextStep();
                      details.onStepContinue;
                    } else {
                      // TODO
                      Navigator.pop(context);
                    }
                  },
                  child:
                      (isLastStep) ? const Text('Submit') : const Text('Next'),
                ),
              ),
            ]);
          },
          steps: [
            Step(
              title: const Text('Match Information'),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Match Number:'),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Match Number',
                          ),
                          onChanged: (value) =>
                              teamScouting.matchNumber = int.parse(value),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Scout Name:'),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Scout Name',
                          ),
                          onChanged: (value) => teamScouting.scoutName = value,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              isActive: true,
            ),
            Step(
              title: const Text('Autonomous'),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (teamScouting.conesAuto > 0) {
                                    teamScouting.conesAuto--;
                                  }
                                });
                              },
                              icon: const Icon(
                                  Icons.remove_circle_outline_outlined),
                              color: Colors.red,
                            ),
                            Text(
                              'Cones: ${teamScouting.conesAuto}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  teamScouting.conesAuto++;
                                });
                              },
                              icon:
                                  const Icon(Icons.add_circle_outline_outlined),
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (teamScouting.conesAuto > 0) {
                                  teamScouting.cubesAuto--;
                                }
                              });
                            },
                            icon: const Icon(
                                Icons.remove_circle_outline_outlined),
                            color: Colors.red,
                          ),
                          Text(
                            'Cubes: ${teamScouting.cubesAuto}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                teamScouting.cubesAuto++;
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline_outlined),
                            color: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Mobility:'),
                            Checkbox(
                              value: teamScouting.mobility,
                              onChanged: (value) {
                                setState(() {
                                  teamScouting.mobility = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              isActive: true,
            ),
            Step(
              title: const Text('Teleop'),
              content: const Text('Content for Step 2'),
              isActive: true,
            ),
            Step(
              title: const Text('Endgame'),
              content: const Text('Content for Step 3'),
              isActive: true,
            ),
          ],
        ),
      ),
    );
  }
}

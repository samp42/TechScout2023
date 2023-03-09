import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/charge_station_auto_enum.dart';
import 'package:scout/enums/charge_station_order_enum.dart';
import 'package:scout/enums/game_piece_enum.dart';
import 'package:scout/enums/teleop_action_enum.dart';
import 'package:scout/models/cycle_timestamp.dart';
import 'package:scout/models/team_scouting.dart';
import 'package:scout/theme.dart';

class TeamScoutingEntry extends StatefulWidget {
  const TeamScoutingEntry({Key? key}) : super(key: key);

  @override
  TeamScoutingEntryState createState() => TeamScoutingEntryState();
}

class TeamScoutingEntryState extends State<TeamScoutingEntry> {
  final formKey = GlobalKey<FormState>();
  final Stopwatch stopwatch = Stopwatch();

  TeamScouting teamScouting = TeamScouting.entry();

  int topCones = 0;
  int midCones = 0;
  int botCones = 0;

  int topCubes = 0;
  int midCubes = 0;
  int botCubes = 0;

  int communityCones = 0;
  int communityCubes = 0;

  int droppedCones = 0;
  int droppedCubes = 0;

  String currentTime = '0';

  GamePieceEnum? currentGamePiece;
  int timeToIntake =
      0; // don't add intake action to cycle just yet, wait for dropped / placed / etc.

  late Timer timer;

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
    stopwatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          currentTime = stopwatch.elapsed.inSeconds.toString();
        });
      }
    });
  }

  @override
  void dispose() {
    stopwatch.stop();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  List<Step> _stepList() => [
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
                    child: Text('Practice Match?'),
                  ),
                  Checkbox(
                      value: teamScouting.practice,
                      onChanged: (value) {
                        setState(() {
                          teamScouting.practice = value!;
                        });
                      }),
                ],
              ),
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Match Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a match number';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid match number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (int.tryParse(value) != null) {
                          teamScouting.matchNumber = int.parse(value);
                        }
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('Team Number:'),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Team Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a team number';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid team number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (int.tryParse(value) != null) {
                          teamScouting.teamNumber = int.parse(value);
                        }
                      },
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
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Scout Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a scout name';
                        }
                        return null;
                      },
                      onChanged: (value) => teamScouting.scoutName = value,
                    ),
                  )
                ],
              ),
            ],
          ),
          isActive: _isActive(0),
          state: _state(0),
        ),
        Step(
          title: const Text('Autonomous'),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
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
                          icon:
                              const Icon(Icons.remove_circle_outline_outlined),
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
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.green,
                        )
                      ],
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
                          icon:
                              const Icon(Icons.remove_circle_outline_outlined),
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
                        const Spacer(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Charging Station:'),
                        const Spacer(),
                        DropdownButton(
                          value: teamScouting.chargeStationAuto,
                          items: ChargeStationAutoEnum.values
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.value),
                                  ))
                              .toList(),
                          onChanged: (ChargeStationAutoEnum? value) {
                            setState(() {
                              teamScouting.chargeStationAuto = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          isActive: _isActive(1),
          state: _state(1),
        ),
        Step(
          title: const Text('Teleop'),
          content: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // don't reset timer if change game piece (potential entry mistake)
                          if (currentGamePiece == null) {
                            timeToIntake = stopwatch.elapsed.inSeconds;
                            stopwatch.reset();
                          }
                          currentGamePiece = GamePieceEnum.cone;
                        });
                      },
                      style: currentGamePiece == GamePieceEnum.cone
                          ? ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 5.0,
                                color: Colors.red,
                              ),
                            )
                          : null,
                      child: Image.asset(
                        'assets/images/cone.jpeg',
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // don't reset timer if change game piece (potential entry mistake)
                          if (currentGamePiece == null) {
                            timeToIntake = stopwatch.elapsed.inSeconds;
                            stopwatch.reset();
                          }
                          currentGamePiece = GamePieceEnum.cube;
                        });
                      },
                      style: currentGamePiece == GamePieceEnum.cube
                          ? ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 5.0,
                                color: Colors.red,
                              ),
                            )
                          : null,
                      child: Image.asset(
                        'assets/images/cube.jpeg',
                        width: 70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        teamScouting.cycles.add(CycleTimestamp(
                          timestamp: stopwatch.elapsed.inSeconds,
                          action: TeleopActionEnum.tippedOver,
                        ));
                        stopwatch.reset();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      child: const Text('Tipped Over'),
                    ),
                  ],
                ),
                // const Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Top Grid',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentGamePiece != null) {
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: timeToIntake,
                                  action: currentGamePiece == GamePieceEnum.cone
                                      ? TeleopActionEnum.intakeCone
                                      : TeleopActionEnum.intakeCube));
                              timeToIntake = 0;
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: stopwatch.elapsed.inSeconds,
                                  action: TeleopActionEnum.placeTop));
                              stopwatch.reset();
                            }
                            if (currentGamePiece == GamePieceEnum.cone) {
                              setState(() {
                                topCones++;
                                currentGamePiece = null;
                              });
                            }
                            if (currentGamePiece == GamePieceEnum.cube) {
                              setState(() {
                                topCubes++;
                                currentGamePiece = null;
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          topCones.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          topCubes.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Middle Grid',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentGamePiece != null) {
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: timeToIntake,
                                  action: currentGamePiece == GamePieceEnum.cone
                                      ? TeleopActionEnum.intakeCone
                                      : TeleopActionEnum.intakeCube));
                              timeToIntake = 0;
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: stopwatch.elapsed.inSeconds,
                                  action: TeleopActionEnum.placeMiddle));
                              stopwatch.reset();
                            }
                            if (currentGamePiece == GamePieceEnum.cone) {
                              setState(() {
                                midCones++;
                                currentGamePiece = null;
                              });
                            }
                            if (currentGamePiece == GamePieceEnum.cube) {
                              setState(() {
                                midCubes++;
                                currentGamePiece = null;
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          midCones.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          midCubes.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Bottom Grid',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentGamePiece != null) {
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: timeToIntake,
                                  action: currentGamePiece == GamePieceEnum.cone
                                      ? TeleopActionEnum.intakeCone
                                      : TeleopActionEnum.intakeCube));
                              timeToIntake = 0;
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: stopwatch.elapsed.inSeconds,
                                  action: TeleopActionEnum.placeBottom));
                              stopwatch.reset();
                            }
                            if (currentGamePiece == GamePieceEnum.cone) {
                              setState(() {
                                botCones++;
                                currentGamePiece = null;
                              });
                            }
                            if (currentGamePiece == GamePieceEnum.cube) {
                              setState(() {
                                botCubes++;
                                currentGamePiece = null;
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          botCones.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          botCubes.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Timer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            currentTime,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Community',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentGamePiece != null) {
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: timeToIntake,
                                  action: currentGamePiece == GamePieceEnum.cone
                                      ? TeleopActionEnum.intakeCone
                                      : TeleopActionEnum.intakeCube));
                              timeToIntake = 0;
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: stopwatch.elapsed.inSeconds,
                                  action: TeleopActionEnum.placeCommunity));
                              stopwatch.reset();
                            }
                            if (currentGamePiece == GamePieceEnum.cone) {
                              setState(() {
                                communityCones++;
                                currentGamePiece = null;
                              });
                            }
                            if (currentGamePiece == GamePieceEnum.cube) {
                              setState(() {
                                communityCubes++;
                                currentGamePiece = null;
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          communityCones.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          communityCubes.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Dropped',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentGamePiece != null) {
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: timeToIntake,
                                  action: currentGamePiece == GamePieceEnum.cone
                                      ? TeleopActionEnum.intakeCone
                                      : TeleopActionEnum.intakeCube));
                              timeToIntake = 0;
                              teamScouting.cycles.add(CycleTimestamp(
                                  timestamp: stopwatch.elapsed.inSeconds,
                                  action: TeleopActionEnum.drop));
                              stopwatch.reset();
                            }
                            if (currentGamePiece == GamePieceEnum.cone) {
                              setState(() {
                                droppedCones++;
                                currentGamePiece = null;
                              });
                            }
                            if (currentGamePiece == GamePieceEnum.cube) {
                              setState(() {
                                droppedCubes++;
                                currentGamePiece = null;
                              });
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          droppedCones.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          droppedCubes.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          isActive: _isActive(2),
          state: _state(2),
        ),
        Step(
          title: const Text('Endgame'),
          content: Column(
            children: [
              Row(
                children: [
                  const Text('Charge Station:'),
                  const Spacer(),
                  DropdownButton(
                      value: teamScouting.chargeStationEndgame,
                      items: ChargeStationEnum.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.value)))
                          .toList(),
                      onChanged: (ChargeStationEnum? value) {
                        setState(() {
                          teamScouting.chargeStationEndgame = value!;
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text('Charge Station Order:'),
                  const Spacer(),
                  DropdownButton(
                      value: teamScouting.chargeStationOrder,
                      items: ChargeStationOrderEnum.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.value)))
                          .toList(),
                      onChanged: (ChargeStationOrderEnum? value) {
                        setState(() {
                          teamScouting.chargeStationOrder = value!;
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  const Text('Card:'),
                  const Spacer(),
                  DropdownButton(
                      value: teamScouting.card,
                      items: CardColorEnum.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.value)))
                          .toList(),
                      onChanged: (CardColorEnum? value) {
                        setState(() {
                          teamScouting.card = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
          isActive: _isActive(3),
          state: _state(3),
        ),
        Step(
          title: const Text('Validation'),
          content: const Text('Validation'),
          isActive: _isActive(4),
          state: _state(4),
        ),
        Step(
          title: const Text('QR Code'),
          content: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: QrImage(
                data: _index == 5 ? teamScouting.toJson().toString() : '',
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
          ),
          isActive: _isActive(5),
          state: _state(5),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Team Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Stepper(
            currentStep: _index,
            type: StepperType.horizontal,
            elevation: 0,
            controlsBuilder: (context, details) {
              final isLastStep = _index == _stepList().length - 1;
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
                      if (_index == _stepList().length - 2) {
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          _nextStep();
                          details.onStepContinue;
                        } else {
                          SnackBar snackBar = const SnackBar(
                            content: Center(
                              child: Text(
                                  'Please fill in all the required fields'),
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else if (_index < _stepList().length - 1) {
                        _nextStep();
                        details.onStepContinue;
                        if (_index == 2) {
                          // officially "start" stopwatch on teleop page
                          stopwatch.reset();
                        }
                      } else {
                        // TODO
                        Navigator.pop(context);
                      }
                    },
                    child: (isLastStep)
                        ? const Text('Submit')
                        : const Text('Next'),
                  ),
                ),
              ]);
            },
            steps: _stepList(),
          ),
        ),
      ),
    );
  }
}

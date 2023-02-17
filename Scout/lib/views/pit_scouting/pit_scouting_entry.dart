import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

import '../../enums/cone_orientation_enum.dart';
import '../../enums/drive_base_type_enum.dart';
import '../../enums/driver_experience_enum.dart';
import '../../enums/grid_level_enum.dart';
import '../../enums/pickup_enum.dart';

class PitScoutingEntry extends StatefulWidget {
  const PitScoutingEntry({Key? key}) : super(key: key);

  @override
  State<PitScoutingEntry> createState() => _PitScoutingEntryState();
}

class _PitScoutingEntryState extends State<PitScoutingEntry> {
  final _formKey = GlobalKey<FormState>();
  int _index = 0;
  late bool isLastStep;
  String? intakeOrientation;
  String? _driveBaseValue;
  String? _pickUp;
  String? _scoringGrid;

  // scout info
  String scoutName = '';
  // team info
  DriverExperienceEnum driverExperience = DriverExperienceEnum.firstYear;
  late int teamNumber;
  // robot info
  late int weight, width, length;
  late DriveBaseTypeEnum driveBaseType;
  bool isStable = false;
  // game pieces
  bool canIntakeCone = false;
  bool canIntakeCube = false;
  late PickupEnum pickupSpots;
  late ConeOrientationEnum intakeConeOrientations;
  // scoring
  late GridLevelEnum gridScoringLevels;
  //late List<GridLevelEnum> gridScoringLevels;
  String scoringNotes = '';

  // charging stations
  String chargingStationNote = '';

  List<Step> stepList() => <Step>[
        Step(
            title: const Text('Identification'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Your Name:     '),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Scout Name',
                        ),
                        onSaved: (value) => setState(() {
                          scoutName = value!;
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Text('Team Number: '),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'ex : 3990'),
                          onSaved: (value) => setState(() {
                                teamNumber = int.parse(value!);
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Team Number';
                            } else if (value.length > 4) {
                              return 'Please Enter a Valid Team Number';
                            } else {
                              return null;
                            }
                          }))
                ]),
              ),
            ])),
        // a faire en mode form
        Step(
            title: const Text('Driver Experience'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Driver Experience: (years)')),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Years',
                    ),
                    onSaved: (value) => setState(() {
                      if (int.parse(value!) == 1) {
                        driverExperience = DriverExperienceEnum.firstYear;
                      } else if (int.parse(value) == 2) {
                        driverExperience = DriverExperienceEnum.secondYear;
                      } else if (int.parse(value) == 3) {
                        driverExperience = DriverExperienceEnum.thirdYear;
                      }
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the Driver Experience';
                      } else if (int.parse(value) != 1 &&
                          int.parse(value) != 2 &&
                          int.parse(value) != 3) {
                        return 'Enter 1,2 or 3 years';
                      } else {
                        return null;
                      }
                    },
                  )),
                ]),
              ),
            ])),
        Step(
            title: const Text('Robot infos'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Weight: (lbs)')),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'Weight'),
                          onSaved: (value) => setState(() {
                                weight = int.parse(value!);
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Weight';
                            } else {
                              return null;
                            }
                          })),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Widht:  (inches)')),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'widht'),
                          onSaved: (value) => setState(() {
                                width = int.parse(value!);
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Weight';
                            } else {
                              return null;
                            }
                          })),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Length:  (inches)')),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'length'),
                    onSaved: (value) => setState(() {
                      length = int.parse(value!);
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter lenght';
                      } else {
                        return null;
                      }
                    },
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Drive Type:')),
                  Expanded(
                      child: DropdownButtonFormField(
                    value: _driveBaseValue,
                    items: const [
                      DropdownMenuItem(value: 'Swerve', child: Text('Swerve')),
                      DropdownMenuItem(value: 'Tank', child: Text('Tank')),
                      DropdownMenuItem(value: 'Other', child: Text('Other'))
                    ],
                    onChanged: (value) => setState(() {
                      _driveBaseValue = value as String;
                    }),
                    onSaved: (value) => setState(() {
                      if (value == 'Swerve') {
                        driveBaseType = DriveBaseTypeEnum.swerve;
                      } else if (_driveBaseValue == 'Tank') {
                        driveBaseType = DriveBaseTypeEnum.tank;
                      } else if (_driveBaseValue == 'Other') {
                        driveBaseType = DriveBaseTypeEnum.other;
                      }
                    }),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select a Drive Type';
                      } else {
                        return null;
                      }
                    },
                  ))
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    const Expanded(child: Text('Is Stable?')),
                    Checkbox(
                        value: isStable,
                        onChanged: (bool? value) {
                          setState(() {
                            isStable = value!;
                          });
                        })
                  ]))
            ])),
        Step(
            title: const Text('Game pieces'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Can intake cones?')),
                  Checkbox(
                      value: canIntakeCone,
                      onChanged: (bool? value) {
                        setState(() {
                          canIntakeCone = value!;
                        });
                      })
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Can intake cubes?')),
                  Checkbox(
                      value: canIntakeCube,
                      onChanged: (bool? value) {
                        setState(() {
                          canIntakeCube = value!;
                        });
                      })
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Pickup Spots')),
                    Expanded(
                        child: DropdownButtonFormField(
                      value: _pickUp,
                      items: const [
                        DropdownMenuItem(value: 'floor', child: Text('Floor')),
                        DropdownMenuItem(
                            value: 'tablet', child: Text('Tablet')),
                        DropdownMenuItem(
                            value: 'floor and tablet',
                            child: Text('Floor and Tablet'))
                      ],
                      onChanged: (value) => setState(() {
                        _pickUp = value as String;
                      }),
                      onSaved: (value) => setState(() {
                        if (value == 'floor') {
                          pickupSpots = PickupEnum.floor;
                        } else if (value == 'tablet') {
                          pickupSpots = PickupEnum.tablet;
                        } else if (value == 'floor and tablet') {
                          pickupSpots = PickupEnum.both;
                        }
                      }),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a pickup Spot';
                        } else {
                          return null;
                        }
                      },
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Intake cone orientation')),
                    Expanded(
                        child: DropdownButtonFormField(
                      value: intakeOrientation,
                      items: const [
                        DropdownMenuItem(
                            value: 'pointing away',
                            child: Text('Pointing away')),
                        DropdownMenuItem(
                            value: 'pointing towards',
                            child: Text('Pointing towards')),
                        DropdownMenuItem(
                            value: 'sideways', child: Text('Sideways')),
                        DropdownMenuItem(
                            value: 'up right', child: Text('Up right'))
                      ],
                      onChanged: (value) => setState(() {
                        intakeOrientation = value as String;
                      }),
                      onSaved: (value) => setState(() {
                        if (value == 'pointing away') {
                          intakeConeOrientations =
                              ConeOrientationEnum.pointingAway;
                        } else if (value == 'pointing towards') {
                          intakeConeOrientations =
                              ConeOrientationEnum.pointingTowards;
                        } else if (value == 'sideways') {
                          intakeConeOrientations = ConeOrientationEnum.sideways;
                        } else if (value == 'up right') {
                          intakeConeOrientations = ConeOrientationEnum.upRight;
                        }
                      }),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select an orientation';
                        } else {
                          return null;
                        }
                      },
                    ))
                  ],
                ),
              )
            ])),
        Step(
            title: const Text('Scoring'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Grid Scoring Levels')),
                  Expanded(
                      child: DropdownButtonFormField(
                    value: _scoringGrid,
                    items: const [
                      DropdownMenuItem(value: 'bottom', child: Text('Bottom')),
                      DropdownMenuItem(value: 'middle', child: Text('Middle')),
                      DropdownMenuItem(value: 'top', child: Text('Top'))
                    ],
                    onChanged: (value) => setState(() {
                      _scoringGrid = value as String;
                    }),
                    onSaved: (value) => setState(() {
                      if (value == 'bottom') {
                        gridScoringLevels = GridLevelEnum.bottom;
                      } else if (value == 'middle') {
                        gridScoringLevels = GridLevelEnum.middle;
                      } else if (value == 'top') {
                        gridScoringLevels = GridLevelEnum.top;
                      }
                    }),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select a Scoring Level';
                      } else {
                        return null;
                      }
                    },
                  ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[Text('Notes :')]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    onSaved: (value) => setState(() {
                      chargingStationNote = value!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some notes';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your notes here',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ])),
        Step(
            title: const Text('Charging station'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[Text('Notes :')]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    onSaved: (value) => setState(() {
                      chargingStationNote = value!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some notes';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your notes here',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                    ),
                  ),
                ),
              ),
            ])),

        const Step(
            title: Text('Submission'),
            content: Text(
              'Click on Submit to submit the scout form',
              textAlign: TextAlign.center,
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Pit Scouting Entry',
            style: TextStyle(color: yellowT4K),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = _index == stepList().length - 1;
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
                      child: (isLastStep)
                          ? const Text('Submit')
                          : const Text('Next'),
                    ),
                  ),
                ]);
              },
              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index < (stepList().length - 1)) {
                  setState(() {
                    _index += 1;
                  });
                } else {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    _formKey.currentState!.save();
                    SnackBar snackBar = const SnackBar(
                      content: Text('Submission completed'),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: stepList()),
        ),
        resizeToAvoidBottomInset:
            true // the scaffold is not going to resize when open keyboard
        );
  }
}

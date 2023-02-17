import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

import '../../enums/cone_orientation_enum.dart';
import '../../enums/drive_base_type_enum.dart';
import '../../enums/driver_experience_enum.dart';
import '../../enums/grid_level_enum.dart';
import '../../enums/pickup_enum.dart';

class PitScoutingEntry extends StatefulWidget {
  PitScoutingEntry({Key? key}) : super(key: key);

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

  List<Step> StepList() => <Step>[
        //fait en mode form
        Step(
            title: const Text('Identification'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Text('Your Name: '),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Scout Name'),
                          onSaved: (value) => setState(() {
                                scoutName = value!;
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name';
                            } else {
                              return null;
                            }
                          }))
                ]),
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
                          decoration: InputDecoration(
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
                  Expanded(child: Text('Widht:  (inches)')),
                  Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
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
                  Expanded(child: Text('length:  (inches)')),
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
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
                      DropdownMenuItem(child: Text('Swerve'), value: 'Swerve'),
                      DropdownMenuItem(child: Text('Tank'), value: 'Tank'),
                      DropdownMenuItem(child: Text('Other'), value: 'Other')
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
                      value: this._pickUp,
                      items: const [
                        DropdownMenuItem(child: Text('Floor'), value: 'floor'),
                        DropdownMenuItem(
                            child: Text('Tablet'), value: 'tablet'),
                        DropdownMenuItem(
                            child: Text('Floor and Tablet'),
                            value: 'floor and tablet')
                      ],
                      onChanged: (value) => setState(() {
                        this._pickUp = value as String;
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
                            child: Text('Pointing away'),
                            value: 'pointing away'),
                        DropdownMenuItem(
                            child: Text('Pointing towards'),
                            value: 'pointing towards'),
                        DropdownMenuItem(
                            child: Text('Sideways'), value: 'sideways'),
                        DropdownMenuItem(
                            child: Text('Up right'), value: 'up right')
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
                  Expanded(child: Text('Grid Scoring Levels')),
                  Expanded(
                      child: DropdownButtonFormField(
                    value: this._scoringGrid,
                    items: const [
                      DropdownMenuItem(child: Text('Bottom'), value: 'bottom'),
                      DropdownMenuItem(child: Text('Middle'), value: 'middle'),
                      DropdownMenuItem(child: Text('Top'), value: 'top')
                    ],
                    onChanged: (value) => setState(() {
                      this._scoringGrid = value as String;
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
                  child: TextFormField(
                    onSaved: (value) => setState(() {
                      scoringNotes = value!;
                    }),
                  ))
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
                  child: TextFormField(
                    onSaved: (value) => setState(() {
                      chargingStationNote = value!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please some notes';
                      } else {
                        return null;
                      }
                    },
                  ))
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
                final isLastStep = _index == StepList().length - 1;
                return Row(children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: (isLastStep)
                          ? const Text('Submit')
                          : const Text('Next'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (_index > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text('Back'),
                      ),
                    )
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
                if (_index < (StepList().length - 1)) {
                  setState(() {
                    _index += 1;
                  });
                } else {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    _formKey.currentState!.save();
                    SnackBar snackBar = SnackBar(
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
              steps: StepList()),
        ),
        resizeToAvoidBottomInset:
            true // the scaffold is not going to resize when open keyboard
        );
  }
}

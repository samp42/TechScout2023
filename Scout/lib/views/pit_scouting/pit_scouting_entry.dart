import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:scout/models/pit_scouting.dart';
import 'package:scout/services/persistence_service.dart';
import 'package:scout/theme.dart';
import 'package:scout/enums/cone_orientation_enum.dart';
import 'package:scout/enums/drive_base_type_enum.dart';
import 'package:scout/enums/driver_experience_enum.dart';
import 'package:scout/enums/grid_level_enum.dart';
import 'package:scout/enums/pickup_enum.dart';

class PitScoutingEntry extends StatefulWidget {
  final PersistenceService storage;
  const PitScoutingEntry({Key? key, required this.storage}) : super(key: key);

  @override
  State<PitScoutingEntry> createState() => _PitScoutingEntryState();
}

class _PitScoutingEntryState extends State<PitScoutingEntry> {
  final _formKey = GlobalKey<FormState>();
  int _index = 0;
  late bool isLastStep;
  String? intakeOrientation;
  String? _driveBaseValue;
  String? _pickUpCubes;
  String? _pickUpCones;
  String? _driverExperience;
  PitScouting? data;

  // scout info
  late String scoutName;
  // team info
  late int teamNumber;
  late DriverExperienceEnum driverExperience;
  // robot info
  late int weight;
  late int width;
  late int length;
  late DriveBaseTypeEnum driveBaseType;
  bool isStable = false;
  bool haveSeparatedIntake = false;
  // game pieces
  bool canIntakeCone = false;
  bool canIntakeCube = false;
  PickupEnum cubesPickupSpots = PickupEnum.none;
  PickupEnum conesPickupSpots = PickupEnum.none;
  final intakeConeOrientations = <ConeOrientationEnum>[];
  bool pointingAway = false;
  bool pointingTowards = false;
  bool sideways = false;
  bool upRight = false;
  late String gamePiecesNotes;
  // scoring
  final conesGridScoringLevels = <GridLevelEnum>[];
  bool? topCones = false;
  bool? middleCones = false;
  bool? bottomCones = false;
  final cubesGridScoringLevel = <GridLevelEnum>[];
  bool? topCubes = false;
  bool? middleCubes = false;
  bool? bottomCubes = false;
  late String scoringNotes;
  // charging station
  late String chargingStationNotes;

  List<Step> stepList() => <Step>[
        Step(
          title: const Text('Identification'), // Change icon here
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Your Name:'),
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
                child: Row(
                  children: <Widget>[
                    const Text('Team Number: '),
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
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
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Driver Experience'),
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Driver Experience: ')),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _driverExperience,
                        items: const [
                          DropdownMenuItem(
                              value: 'First Year', child: Text('First Year')),
                          DropdownMenuItem(
                              value: 'Second Year', child: Text('Second Year')),
                          DropdownMenuItem(
                              value: 'Third Year', child: Text('Third Year')),
                        ],
                        onChanged: (value) => setState(() {
                          _driverExperience = value as String;
                        }),
                        onSaved: (value) => setState(() {
                          if (value == 'First Year') {
                            driverExperience = DriverExperienceEnum.firstYear;
                          } else if (value == 'Second Year') {
                            driverExperience = DriverExperienceEnum.secondYear;
                          } else if (value == 'Third Year') {
                            driverExperience = DriverExperienceEnum.thirdYear;
                          }
                        }),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          } else {
                            return null;
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Robot Infos'),
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Weight: (lbs)')),
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'Weight'),
                          onSaved: (value) => setState(() {
                                weight = int.parse(value!);
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Weight';
                            } else if (value.length > 3) {
                              return 'Invalid Weight';
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Width:  (inches)')),
                    Expanded(
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: 'width'),
                          onSaved: (value) => setState(() {
                                width = int.parse(value!);
                              }),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Weight';
                            } else if (value.length > 2) {
                              return 'Invalid Width';
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Length:  (inches)')),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'length'),
                        onSaved: (value) => setState(() {
                          length = int.parse(value!);
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter lenght';
                          } else if (value.length > 2) {
                            return 'Invalid Lenght';
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
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Drive Type:')),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _driveBaseValue,
                        items: const [
                          DropdownMenuItem(
                              value: 'Swerve', child: Text('Swerve')),
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
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  const Expanded(child: Text('Looks Stable?')),
                  Checkbox(
                      value: isStable,
                      onChanged: (bool? value) {
                        setState(() {
                          isStable = value!;
                        });
                      })
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Split Intake?')),
                    Checkbox(
                        value: haveSeparatedIntake,
                        onChanged: (bool? value) {
                          setState(() {
                            haveSeparatedIntake = value!;
                          });
                        })
                  ],
                ),
              )
            ],
          ),
        ),
        Step(
          title: const Text('Game Pieces'),
          content: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Can intake cones?')),
                    Checkbox(
                        value: canIntakeCone,
                        onChanged: (bool? value) {
                          setState(() {
                            canIntakeCone = value!;
                          });
                        })
                  ],
                ),
              ),
              if (canIntakeCone)
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Expanded(child: Text('Pointing Away')),
                          Expanded(
                            child: Checkbox(
                              value: pointingAway,
                              onChanged: (value) {
                                setState(() {
                                  pointingAway = value!;
                                  if (value) {
                                    intakeConeOrientations
                                        .add(ConeOrientationEnum.pointingAway);
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Expanded(child: Text('Pointing Towards')),
                          Expanded(
                            child: Checkbox(
                              value: pointingTowards,
                              onChanged: (value) {
                                setState(() {
                                  pointingTowards = value!;
                                  if (value) {
                                    intakeConeOrientations.add(
                                        ConeOrientationEnum.pointingTowards);
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Expanded(child: Text('Sideways')),
                          Expanded(
                            child: Checkbox(
                              value: sideways,
                              onChanged: (value) {
                                setState(() {
                                  sideways = value!;
                                  if (value) {
                                    intakeConeOrientations
                                        .add(ConeOrientationEnum.sideways);
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Expanded(child: Text('Up Right')),
                          Expanded(
                            child: Checkbox(
                              value: upRight,
                              onChanged: (value) {
                                setState(() {
                                  upRight = value!;
                                  if (value) {
                                    intakeConeOrientations
                                        .add(ConeOrientationEnum.upRight);
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              if (canIntakeCone)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(child: Text('Pickup Spots')),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _pickUpCones,
                          items: const [
                            DropdownMenuItem(
                                value: 'floor', child: Text('Floor')),
                            DropdownMenuItem(
                                value: 'tablet', child: Text('Tablet')),
                            DropdownMenuItem(
                                value: 'floor and tablet',
                                child: Text('Floor and Tablet'))
                          ],
                          onChanged: (value) => setState(() {
                            _pickUpCones = value as String;
                          }),
                          onSaved: (value) => setState(() {
                            if (value == 'floor') {
                              conesPickupSpots = PickupEnum.floor;
                            } else if (value == 'tablet') {
                              conesPickupSpots = PickupEnum.tablet;
                            } else if (value == 'floor and tablet') {
                              conesPickupSpots = PickupEnum.both;
                            }
                          }),
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select a pickup Spot';
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Can intake cubes?')),
                    Checkbox(
                        value: canIntakeCube,
                        onChanged: (bool? value) {
                          setState(() {
                            canIntakeCube = value!;
                          });
                        })
                  ],
                ),
              ),
              if (canIntakeCube)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(child: Text('Pickup Spots')),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _pickUpCubes,
                          items: const [
                            DropdownMenuItem(
                                value: 'floor', child: Text('Floor')),
                            DropdownMenuItem(
                                value: 'tablet', child: Text('Tablet')),
                            DropdownMenuItem(
                                value: 'floor and tablet',
                                child: Text('Floor and Tablet'))
                          ],
                          onChanged: (value) => setState(() {
                            _pickUpCubes = value as String;
                          }),
                          onSaved: (value) => setState(() {
                            if (value == 'floor') {
                              cubesPickupSpots = PickupEnum.floor;
                            } else if (value == 'tablet') {
                              cubesPickupSpots = PickupEnum.tablet;
                            } else if (value == 'floor and tablet') {
                              cubesPickupSpots = PickupEnum.both;
                            }
                          }),
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select a pickup Spot';
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
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
                      gamePiecesNotes = value!;
                    }),
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
              )
            ],
          ),
        ),
        Step(
            title: const Text('Scoring'),
            content: Column(children: <Widget>[
              if (canIntakeCone)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cones in Top Grid?')),
                      Expanded(
                        child: Checkbox(
                            value: topCones,
                            onChanged: (value) {
                              setState(() {
                                topCones = value!;
                                if (value) {
                                  conesGridScoringLevels.add(GridLevelEnum.top);
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
              if (canIntakeCone)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cones in Middle Grid?')),
                      Expanded(
                        child: Checkbox(
                          value: middleCones,
                          onChanged: (value) {
                            setState(() {
                              middleCones = value!;
                              if (value) {
                                conesGridScoringLevels
                                    .add(GridLevelEnum.middle);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              if (canIntakeCone)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cones in Bottom Grid?')),
                      Expanded(
                        child: Checkbox(
                            value: bottomCones,
                            onChanged: (value) {
                              setState(() {
                                bottomCones = value!;
                                if (value) {
                                  conesGridScoringLevels
                                      .add(GridLevelEnum.bottom);
                                }
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              if (canIntakeCube)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cubes in Top Grid?')),
                      Expanded(
                        child: Checkbox(
                            value: topCubes,
                            onChanged: (value) {
                              setState(() {
                                topCubes = value!;
                                if (value) {
                                  cubesGridScoringLevel.add(GridLevelEnum.top);
                                }
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              if (canIntakeCube)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cubes in Middle Grid?')),
                      Expanded(
                        child: Checkbox(
                            value: middleCubes,
                            onChanged: (value) {
                              setState(() {
                                middleCubes = value!;
                                if (value) {
                                  cubesGridScoringLevel
                                      .add(GridLevelEnum.middle);
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
              if (canIntakeCube)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                          child: Text('Can score cubes in Bottom Grid?')),
                      Expanded(
                        child: Checkbox(
                            value: bottomCubes,
                            onChanged: (value) {
                              setState(() {
                                bottomCubes = value!;
                                if (value) {
                                  cubesGridScoringLevel
                                      .add(GridLevelEnum.bottom);
                                }
                              });
                            }),
                      )
                    ],
                  ),
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
                      scoringNotes = value!;
                    }),
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
                      chargingStationNotes = value!;
                    }),
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
            'Click on Next to submit the scout form',
            textAlign: TextAlign.center,
          ),
        ),
        Step(
          title: const Text('QR Code'),
          content: Center(
            child: data != null
                ? Column(
                    children: [
                      Text(
                        data!.teamNumber.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      QrImage(
                        data: data!.toJson().toString(),
                        version: QrVersions.auto,
                        size: 240,
                        gapless: false,
                        embeddedImage: const AssetImage(
                            'assets/images/T4K_RGB_round[colour]_transparent.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(40, 40),
                        ),
                      )
                    ],
                  )
                : const Text('Make sure everything is correctly filled out'),
          ),
        ),
      ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> writeData(PitScouting robot) async {
    return widget.storage.writeRobot(robot);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(_index == stepList().length - 1 ? 0 : 56),
          child: AppBar(
            backgroundColor: materialBlackT4K,
            title: const Text(
              'New Pit Scouting Entry',
              style: TextStyle(color: yellowT4K),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = (_index == stepList().length - 1);
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
                if (_index < (stepList().length - 2)) {
                  setState(() {
                    _index += 1;
                  });
                } else if (_index == (stepList().length - 2)) {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    setState(() {
                      _formKey.currentState!.save();
                      data = fillModel();
                      writeData(data!);

                      SnackBar snackBar = const SnackBar(
                        content: Text('Submission completed'),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _index++;
                    });
                  } else {
                    SnackBar snackBar = const SnackBar(
                      content: Text('Please fill in all the required fields'),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  Navigator.of(context).pop();
                }
              },
              onStepTapped: (int index) {
                if (index < (stepList().length - 1)) {
                  setState(() {
                    _index = index;
                  });
                }
              },
              steps: stepList()),
        ),
        resizeToAvoidBottomInset:
            true // the scaffold is not going to resize when open keyboard
        );
  }

  PitScouting fillModel() {
    return PitScouting.full(
        teamNumber: teamNumber,
        scoutName: scoutName,
        driverExperience: driverExperience,
        weight: weight,
        width: width,
        length: length,
        driveBaseType: driveBaseType,
        stable: isStable,
        hasSeparateIntake: haveSeparatedIntake,
        canIntakeCone: canIntakeCone,
        canIntakeCube: canIntakeCube,
        pickupSpotsCube: cubesPickupSpots,
        pickupSpotsCone: conesPickupSpots,
        gamePiecesNotes: gamePiecesNotes,
        intakeConeOrientations: intakeConeOrientations,
        gridScoringLevelsCube: cubesGridScoringLevel,
        gridScoringLevelsCone: conesGridScoringLevels,
        scoringNotes: scoringNotes,
        chargingStationNotes: chargingStationNotes);
  }
}

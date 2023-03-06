import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

import '../../enums/card_color_enum.dart';
import '../../enums/charge_station_enum.dart';
import '../../enums/charge_station_order_enum.dart';
import '../../enums/grid_level_enum.dart';
import '../../models/cycle_timestamp.dart';

class MatchScoutingEntry extends StatefulWidget {
  const MatchScoutingEntry({super.key});

  @override
  State<StatefulWidget> createState() => _MatchScoutingEntry();
}

class _MatchScoutingEntry extends State<MatchScoutingEntry> {
  final _formKey = GlobalKey<FormState>();
  int _index = 0;
  //Identification
  late String scoutName;
  late int teamNumber;
  late int matchNumber;
  // Autonomous
  late bool mobility;
  late ChargeStationEnum chargeStationAuto;
  late Map<GridLevelEnum, int> conesAuto;
  late Map<GridLevelEnum, int> cubesAuto;

  // Teleop
  late List<CycleTimestamp> cycles;
  late int penalties;

  // End Game
  late ChargeStationEnum chargeStationEndgame;
  late ChargeStationOrderEnum chargeStationOrder;
  late CardColorEnum card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Match Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          steps: stepList(),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = (_index == stepList().length - 1);
            return Row(children: [
              if (_index < 0)
                Expanded(
                    child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text('Back'))),
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: (isLastStep)
                          ? const Text('Submit')
                          : const Text('Next')))
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
                setState(() {
                  _formKey.currentState!.save();
                });
              }
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  List<Step> stepList() => <Step>[
        //Identification
        Step(
          title: const Text('Identification'),
          content: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Your name:'),
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
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Team Number:'),
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'ex: 3990'),
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
                      },
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Match Number:'),
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'ex: 1'),
                      onSaved: (value) => setState(() {
                        teamNumber = int.parse(value!);
                      }),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a Match Number';
                        } else if (value.length > 2) {
                          return 'Please Enter a Valid Match Number';
                        } else {
                          return null;
                        }
                      },
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Autonomus'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(),
                ),
              ],
            ),
          ),
        ),
//        Step(title: const Text('TeleOp'), content: widget),
//        Step(title: const Text('End Game'), content: widget),
//        Step(title: const Text('Submit'), content: widget)
      ];
}

/*
class MatchScoutingEntry extends StatelessWidget {
  const MatchScoutingEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Match Scouting Entry',
          style: TextStyle(color: yellowT4K),
        ),
      ),
      body: const Center(
        child: Text('Match Scouting Entry'),
      ),
    );
  }

}
 */

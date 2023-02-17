import 'package:flutter/material.dart';
import 'package:scout/theme.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class PitScoutingEntry extends StatefulWidget {
  const PitScoutingEntry({Key? key}) : super(key: key);

  @override
  State<PitScoutingEntry> createState() => _PitScoutingEntryState();
}

class _PitScoutingEntryState extends State<PitScoutingEntry> {
  bool? isStable = false;
  bool? canIntakeCone = false;
  bool? canIntakeCube = false;
  int _index = 0;
  late bool isLastStep;

  List<Step> stepList() => <Step>[
        Step(
            title: const Text('Identification'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Your Name: ')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Scout Name'),
                  ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Team Number: ')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter team number'),
                  ))
                ]),
              ),
            ])),
        Step(
            title: const Text('Driver Experience'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Driver Experience: (years)')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Years',
                    ),
                  )),
                ]),
              ),
            ])),
        Step(
            title: const Text('Robot infos'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Weight: (lbs)')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Weight'),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Widht:  (inches)')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'widht'),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Length:  (inches)')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'length'),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Drivebase Type:')),
                  Expanded(
                      child: DropDownTextField(dropDownList: [
                    DropDownValueModel(name: 'Swerve', value: 'Swerve'),
                    DropDownValueModel(name: 'Tank', value: 'Tank'),
                    DropDownValueModel(name: 'Other', value: 'Other')
                  ]))
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    const Expanded(child: Text('Is Stable?')),
                    Checkbox(
                        value: isStable,
                        onChanged: (bool? value1) {
                          setState(() {
                            isStable = value1;
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
                      onChanged: (bool? value1) {
                        setState(() {
                          canIntakeCone = value1;
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
                      onChanged: (bool? value1) {
                        setState(() {
                          canIntakeCube = value1;
                        });
                      })
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(child: Text('Pickup Spots')),
                    Expanded(
                        child: DropDownTextField(dropDownList: [
                      DropDownValueModel(name: 'Floor', value: 'floor'),
                      DropDownValueModel(name: 'Tablet', value: 'tablet'),
                      DropDownValueModel(
                          name: 'Floor and Tablet', value: 'floor and tablet')
                    ]))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(child: Text('Intake cone orientation')),
                    Expanded(
                        child: DropDownTextField(dropDownList: [
                      DropDownValueModel(
                          name: 'Pointing away', value: 'pointing away'),
                      DropDownValueModel(
                          name: 'Pointing towards', value: 'pointing towards'),
                      DropDownValueModel(name: 'Sideways', value: 'sideways'),
                      DropDownValueModel(name: 'Up right', value: 'up right')
                    ]))
                  ],
                ),
              )
            ])),
        Step(
            title: const Text('Scoring'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('Grid Scoring Levels')),
                  Expanded(
                      child: DropDownTextField(dropDownList: [
                    DropDownValueModel(name: 'Bottom', value: 'bottom'),
                    DropDownValueModel(name: 'Middle', value: 'middle'),
                    DropDownValueModel(name: 'Top', value: 'top')
                  ]))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[Text('Notes :')]),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Enter your notes here',
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ])),
        Step(
            title: const Text('Charging station'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[Text('Notes :')]),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter your notes here',
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ])),
      ];

  @override
  Widget build(BuildContext context) {
    //final ScrollController _scrollController = ScrollController();
    // final driveType = []

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Pit Scouting Entry',
            style: TextStyle(color: yellowT4K),
          ),
        ),
        body: Stepper(
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
                // print('Submited');
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: stepList()),
        resizeToAvoidBottomInset:
            true // the scaffold is not going to resize when open keyboard
        );
  }
}

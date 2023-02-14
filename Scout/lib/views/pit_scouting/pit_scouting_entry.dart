import 'package:flutter/material.dart';
import 'package:scout/theme.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class PitScoutingEntry extends StatefulWidget {
  PitScoutingEntry({Key? key}) : super(key: key);

  @override
  State<PitScoutingEntry> createState() => _PitScoutingEntryState();
}

class _PitScoutingEntryState extends State<PitScoutingEntry> {
  bool? isStable = true;
  bool? canIntakeCone = true;
  bool? canIntakeCube = true;
  int _index = 0;
  late bool isLastStep;

  List<Step> StepList() => <Step>[
        Step(
            title: const Text('Identification'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('  Your Name: ')),
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
                  Expanded(child: Text('  Team Number: ')),
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
                  Expanded(child: Text('  Driver Experience: (years)')),
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
                  Expanded(child: Text('  Weight: (lbs)')),
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
                  Expanded(child: Text('  Widht:  (inches)')),
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
                  Expanded(child: Text('  Height:  (inches)')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'height'),
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('  Drive Type:  ')),
                  Expanded(
                      child: DropDownTextField(dropDownList: [
                    DropDownValueModel(name: 'Swerve', value: 'Swerve'),
                    DropDownValueModel(name: 'Tank', value: 'Tank'),
                    DropDownValueModel(name: 'Other', value: 'Other')
                  ]))
                ]),
              ),
              Row(children: <Widget>[
                const Expanded(child: Text('  Is Stable?')),
                Checkbox(
                    value: a,
                    onChanged: (bool? value1) {
                      setState(() {
                        a = value1;
                      });
                    })
              ])
            ])),
        Step(
            title: const Text('Game pieces'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('  Your Name: ')),
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
                  Expanded(child: Text('  Team Number: ')),
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
            title: const Text('Scoring'),
            content: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: const <Widget>[
                  Expanded(child: Text('  Your Name: ')),
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
                  Expanded(child: Text('  Team Number: ')),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter team number'),
                  ))
                ]),
              ),
            ])),
        const Step(
          title: Text('Charging station'),
          content: Text('Final Content Review'),
        ),
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
                print('Submited');
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: StepList()),
        resizeToAvoidBottomInset:
            false // the scaffold is not going to resize when open keyboard
        );
  }
}

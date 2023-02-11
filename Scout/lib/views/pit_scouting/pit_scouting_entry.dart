import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

class PitScoutingEntry extends StatelessWidget {
  const PitScoutingEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Pit Scouting Entry',
            style: TextStyle(color: yellowT4K),
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Row(children: const <Widget>[
              Expanded(child: Text('  Your Name: ')),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Scout Name'),
              ))
            ]),
            Row(children: const <Widget>[
              Expanded(child: Text('  Team Number: ')),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter team number'),
              ))
            ])
          ]),
        ),
        resizeToAvoidBottomInset:
            false // the scaffold is not going to resize when open keyboard
        );
  }
}

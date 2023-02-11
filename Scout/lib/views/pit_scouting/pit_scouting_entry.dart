import 'package:flutter/material.dart';
import 'package:scout/theme.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class PitScoutingEntry extends StatelessWidget {
  const PitScoutingEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    // final driveType = []

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Pit Scouting Entry',
            style: TextStyle(color: yellowT4K),
          ),
        ),
        body: Column(children: <Widget>[
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

          /*   Scrollbar(
            thumbVisibility: false,
            controller: _scrollController,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Scrollable 1 : Index $index'),
                  );
                }),
          ),*/
        ]),
        resizeToAvoidBottomInset:
            false // the scaffold is not going to resize when open keyboard
        );
  }
}

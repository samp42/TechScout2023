import 'package:flutter/material.dart';
import 'package:scout/theme.dart';

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
            ]),
            Row(children: const <Widget>[
              Expanded(child: Text('  Driver Experience: ')),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Years',
                ),
              )),
              Expanded(child: Text('  years')),
            ]),
            Row(children: const <Widget>[
              Expanded(child: Text('  Weight: ')),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'weight'),
              )),
              Expanded(
                child: Text('  lb'),
              )
            ]),
            Row(children: const <Widget>[
              Expanded(child: Text('  Widht:  ')),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'widht'),
              )),
              Expanded(child: Text('  inches'))
            ]),
            Row(children: const <Widget>[
              Expanded(child: Text('  Drive Type:  ')),
            ])
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
        ),
        resizeToAvoidBottomInset:
            false // the scaffold is not going to resize when open keyboard
        );
  }
}

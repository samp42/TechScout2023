import 'package:flutter/material.dart';
import 'package:scout/models/pit_scouting.dart';
import 'package:scout/views/match_scouting/match_scouting_entry.dart';
import 'package:scout/views/match_scouting/match_scouting_list.dart';
import 'package:scout/views/pit_scouting/pit_scouting_entry.dart';
import 'package:scout/views/pit_scouting/pit_scouting_list.dart';
import 'package:scout/views/practice_field_scouting/practice_field_scouting_entry.dart';
import 'package:scout/views/practice_field_scouting/practice_field_scouting_list.dart';
import 'package:scout/views/team_scouting/team_scouting_entry.dart';
import 'package:scout/views/team_scouting/team_scouting_list.dart';
import 'package:scout/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final _title = 'Tech Scout';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: materialBlackT4K,
        fontFamily: 'Futura',
      ),
      home: MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  void _navigate() {
    Navigator.push(
        context,
        _pageIndex == 0
            ? MaterialPageRoute(builder: (context) => const PitScoutingEntry())
            : (_pageIndex == 1
                ? MaterialPageRoute(
                    builder: (context) => const PracticeFieldScoutingEntry())
                : MaterialPageRoute(
                    builder: (context) => const MatchScoutingEntry())));
  }

  final List<Widget> _tabs = [
    PitScoutingList(list: PitScoutingEntry.list),
    PracticeFieldScoutingList(),
    MatchScoutingList(),
    TeamScoutingList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: yellowT4K)),
      ),
      body: _tabs[_pageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        tooltip: 'New Entry',
        backgroundColor: yellowT4K,
        foregroundColor: blackT4K,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house_sharp),
            label: 'Pit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg),
            label: 'Practice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Match',
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: blackT4K,
        onTap: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}

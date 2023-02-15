import 'dart:convert';

class MatchScouting {
  // general info
  num matchNumber;
  String scoutName;

  // teams
  List<num> redTeams;
  List<num> blueTeams;

  // links
  num redLinks;
  num blueLinks;

  // coopertition
  bool redCoopertition;
  bool blueCoopertition;

  // endgame
  bool redEngaged;
  bool blueEngaged;

  MatchScouting(
      {required this.matchNumber,
      required this.scoutName,
      required this.redTeams,
      required this.blueTeams,
      required this.redLinks,
      required this.blueLinks,
      required this.redCoopertition,
      required this.blueCoopertition,
      required this.redEngaged,
      required this.blueEngaged});

  MatchScouting.fromMap(Map<String, dynamic> map)
      : matchNumber = map['matchNumber'],
        scoutName = map['scoutName'],
        redTeams = List<num>.from(map['redTeams']),
        blueTeams = List<num>.from(map['blueTeams']),
        redLinks = map['redLinks'],
        blueLinks = map['blueLinks'],
        redCoopertition = map['redCoopertition'],
        blueCoopertition = map['blueCoopertition'],
        redEngaged = map['redEngaged'],
        blueEngaged = map['blueEngaged'];

  Map<String, dynamic> _toMap() {
    return {
      'matchNumber': matchNumber,
      'scoutName': scoutName,
      'redTeams': redTeams,
      'blueTeams': blueTeams,
      'redLinks': redLinks,
      'blueLinks': blueLinks,
      'redCoopertition': redCoopertition,
      'blueCoopertition': blueCoopertition,
      'redEngaged': redEngaged,
      'blueEngaged': blueEngaged,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

import 'dart:convert';

class MatchScouting {
  // general info
  int? matchNumber;
  String? scoutName;

  // teams
  late List<int> redTeams;
  late List<int> blueTeams;

  // links
  late int redLinks;
  late int blueLinks;

  // coopertition
  late bool redCoopertition;
  late bool blueCoopertition;

  // endgame
  late bool redEngaged;
  late bool blueEngaged;

  // match results
  late int redScore;
  late int blueScore;
  late int redPenalty;
  late int bluePenalty;

  MatchScouting();

  MatchScouting.entry() {
    redTeams = List.filled(3, 0, growable: false);
    blueTeams = List.filled(3, 0, growable: false);
    redLinks = 0;
    blueLinks = 0;
    redCoopertition = false;
    blueCoopertition = false;
    redEngaged = false;
    blueEngaged = false;
  }

  MatchScouting.allArgs({
    required this.matchNumber,
    required this.scoutName,
    required this.redTeams,
    required this.blueTeams,
    required this.redLinks,
    required this.blueLinks,
    required this.redCoopertition,
    required this.blueCoopertition,
    required this.redEngaged,
    required this.blueEngaged,
    required this.redScore,
    required this.blueScore,
    required this.redPenalty,
    required this.bluePenalty,
  });

  MatchScouting.fromMap(Map<String, dynamic> map)
      : matchNumber = map['matchNumber'],
        scoutName = map['scoutName'],
        redTeams = List<int>.from(map['redTeams']),
        blueTeams = List<int>.from(map['blueTeams']),
        redLinks = map['redLinks'],
        blueLinks = map['blueLinks'],
        redCoopertition = map['redCoopertition'],
        blueCoopertition = map['blueCoopertition'],
        redEngaged = map['redEngaged'],
        blueEngaged = map['blueEngaged'],
        redScore = map['redScore'],
        blueScore = map['blueScore'],
        redPenalty = map['redPenalty'],
        bluePenalty = map['bluePenalty'];

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
      'redScore': redScore,
      'blueScore': blueScore,
      'redPenalty': redPenalty,
      'bluePenalty': bluePenalty,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

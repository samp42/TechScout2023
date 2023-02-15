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

  // match results
  num redScore;
  num blueScore;
  num redPenalty;
  num bluePenalty;
  num redRankingPoints;
  num blueRankingPoints;

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
      required this.blueEngaged,
      required this.redScore,
      required this.blueScore,
      required this.redPenalty,
      required this.bluePenalty,
      required this.redRankingPoints,
      required this.blueRankingPoints});

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
        blueEngaged = map['blueEngaged'],
        redScore = map['redScore'],
        blueScore = map['blueScore'],
        redPenalty = map['redPenalty'],
        bluePenalty = map['bluePenalty'],
        redRankingPoints = map['redRankingPoints'],
        blueRankingPoints = map['blueRankingPoints'];

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
      'redRankingPoints': redRankingPoints,
      'blueRankingPoints': blueRankingPoints,
    };
  }

  String toJson() => jsonEncode(_toMap());
}

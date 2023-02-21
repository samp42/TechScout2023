import 'dart:convert';

class MatchScouting {
  // general info
  late num matchNumber;
  late String scoutName;

  // teams
  late List<num> redTeams;
  late List<num> blueTeams;

  // links
  late num redLinks;
  late num blueLinks;

  // coopertition
  late bool redCoopertition;
  late bool blueCoopertition;

  // endgame
  late bool redEngaged;
  late bool blueEngaged;

  // match results
  late num redScore;
  late num blueScore;
  late num redPenalty;
  late num bluePenalty;
  late num redRankingPoints;
  late num blueRankingPoints;

  MatchScouting();

  MatchScouting.allArgs(
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

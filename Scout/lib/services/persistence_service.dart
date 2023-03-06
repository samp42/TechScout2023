import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:scout/models/match_scouting.dart';

import 'package:scout/models/pit_scouting.dart';

class PersistenceService {
  void writeRobot(PitScouting robot) async {
    final fileName = 'robot_${robot.teamNumber}';
    final _ = await _writeJson(fileName, robot);
  }

  void writeMatch(MatchScouting match) async {
    final fileName = 'match_${match.matchNumber}';
    final _ = await _writeJson(fileName, match);
  }

  Future<PitScouting> readRobotByTeamNumber(num teamNumber) async {
    final fileName = 'robot_$teamNumber';
    final json = await _readJson(fileName);
    return PitScouting.fromMap(json);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String completeFileName) async {
    final path = await _localPath;
    return File('$path/$completeFileName');
  }

  Future<Map<String, dynamic>> _readJson(String fileName) async {
    try {
      final file = await _localFile('$fileName.json');

      // Read the file
      final contents = await file.readAsString();

      // decode json from contents into a map
      return jsonDecode(contents);
    } catch (e) {
      // If encountering an error, return 0
      return {};
    }
  }

  Future<File> _writeJson(String fileName, Object content) async {
    final file = await _localFile('$fileName.json');

    return file.writeAsString(jsonEncode(content));
  }
}

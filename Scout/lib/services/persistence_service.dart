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

  List<MatchScouting> readMatches() {
    // list all files in directory starting by 'match_'
    final directory = getApplicationDocumentsDirectory();
    final matches = <MatchScouting>[];
    final files = directory
        .then((dir) => dir.listSync().where((element) {
              return element.path.contains('match_') && element is File;
            }))
        .then((file) {
      if(file is File) {
        final json = _readJsonFromFile(file as File)
            .then((value) => matches.add(MatchScouting.fromMap(value)));
      }
    });

    return matches;
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

  Future<Map<String, dynamic>> _readJsonFromFile(File file) async {
    try {
      // Read the file
      final contents = await file.readAsString();

      // decode json from contents into a map
      return jsonDecode(contents);
    } catch (e) {
      throw Exception('Error reading file');
    }
  }

  Future<File> _writeJson(String fileName, Object content) async {
    final file = await _localFile('$fileName.json');

    return file.writeAsString(jsonEncode(content));
  }
}

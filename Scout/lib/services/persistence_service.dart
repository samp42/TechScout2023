import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/robot.dart';

class PersistenceService {

  void writeRobot(Robot robot) async {
    final fileName = 'robot_${robot.teamNumber}';
    final _ = await _writeJson(fileName, robot);
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

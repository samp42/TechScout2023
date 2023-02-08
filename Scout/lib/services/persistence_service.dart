import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PersistenceService {
  static const String pitScoutingSuffix = '_pit';
  static const String matchScoutingSuffix = '_match';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> localFile(String completeFileName) async {
    final path = await _localPath;
    return File('$path/$completeFileName');
  }

  Future<Map<String, dynamic>> readJson(
      String fileName, Map<String, dynamic> Function(String s) decoder) async {
    try {
      final file = await localFile('$fileName.json');

      // Read the file
      final contents = await file.readAsString();

      // decode json from contents into a map
      return decoder(contents);
    } catch (e) {
      // If encountering an error, return 0
      return {};
    }
  }

  Future<File> writeJson(String fileName, Map<String, dynamic> content) async {
    final file = await localFile('$fileName.json');

    return file.writeAsString(content.toString());
  }
}

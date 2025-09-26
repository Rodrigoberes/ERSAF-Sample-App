import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../business/models/user.dart';

class LocalStorageService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
  }

  Future<List<User>> readUsers() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(contents);
        return jsonList.map((json) => User.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<File> writeUsers(List<User> users) async {
    final file = await _localFile;
    final jsonList = users.map((user) => user.toJson()).toList();
    return file.writeAsString(jsonEncode(jsonList));
  }

  Future<void> deleteUsersFile() async {
    final file = await _localFile;
    if (await file.exists()) {
      await file.delete();
    }
  }
}
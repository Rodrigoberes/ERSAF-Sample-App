import 'package:logging/logging.dart';

import '../../services/local_storage_service.dart';
import '../models/user.dart';

class UserRepository {
  UserRepository({required LocalStorageService storageService})
      : _storageService = storageService;

  final LocalStorageService _storageService;
  final Logger _logger = Logger('UserRepository');

  Future<List<User>> loadUsers() async {
    try {
      final users = await _storageService.readUsers();
      _logger.info('Loaded ${users.length} users from storage');
      return users;
    } catch (e) {
      _logger.severe('Failed to load users: $e');
      rethrow;
    }
  }

  Future<void> saveUsers(List<User> users) async {
    try {
      await _storageService.writeUsers(users);
      _logger.info('Saved ${users.length} users to storage');
    } catch (e) {
      _logger.severe('Failed to save users: $e');
      rethrow;
    }
  }

  Future<void> deleteUsersFile() async {
    try {
      await _storageService.deleteUsersFile();
      _logger.info('Deleted users file');
    } catch (e) {
      _logger.severe('Failed to delete users file: $e');
      rethrow;
    }
  }
}
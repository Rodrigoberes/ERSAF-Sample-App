import 'dart:io';

import 'package:ersaf_sampleapp/business/models/user.dart';
import 'package:ersaf_sampleapp/business/repositories/user_repository.dart';
import 'package:ersaf_sampleapp/services/local_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([LocalStorageService])
import 'user_repository_test.mocks.dart';

void main() {
  late UserRepository userRepository;
  late MockLocalStorageService mockStorageService;

  setUp(() {
    mockStorageService = MockLocalStorageService();
    userRepository = UserRepository(storageService: mockStorageService);
  });

  group('UserRepository', () {
    final testUser = User(
      uid: 'test-uid',
      name: 'John',
      surname: 'Doe',
      email: 'john.doe@example.com',
      passwordHash: User.hashPassword('password'),
      createdAt: DateTime(2023, 1, 1),
      updatedAt: DateTime(2023, 1, 2),
    );

    final testUsers = [testUser];

    test('loadUsers returns list of users from storage', () async {
      when(mockStorageService.readUsers()).thenAnswer((_) async => testUsers);

      final result = await userRepository.loadUsers();

      expect(result, testUsers);
      verify(mockStorageService.readUsers()).called(1);
    });

    test('loadUsers throws exception when storage fails', () async {
      when(mockStorageService.readUsers()).thenThrow(Exception('Storage error'));

      expect(() => userRepository.loadUsers(), throwsException);
      verify(mockStorageService.readUsers()).called(1);
    });

    test('saveUsers calls storage service', () async {
      final mockFile = File('mock_file');
      when(mockStorageService.writeUsers(testUsers)).thenAnswer((_) async => mockFile);

      await userRepository.saveUsers(testUsers);

      verify(mockStorageService.writeUsers(testUsers)).called(1);
    });

    test('saveUsers throws exception when storage fails', () async {
      when(mockStorageService.writeUsers(testUsers)).thenThrow(Exception('Storage error'));

      expect(() => userRepository.saveUsers(testUsers), throwsException);
      verify(mockStorageService.writeUsers(testUsers)).called(1);
    });

    test('deleteUsersFile calls storage service', () async {
      when(mockStorageService.deleteUsersFile()).thenAnswer((_) async {});

      await userRepository.deleteUsersFile();

      verify(mockStorageService.deleteUsersFile()).called(1);
    });

    test('deleteUsersFile throws exception when storage fails', () async {
      when(mockStorageService.deleteUsersFile()).thenThrow(Exception('Storage error'));

      expect(() => userRepository.deleteUsersFile(), throwsException);
      verify(mockStorageService.deleteUsersFile()).called(1);
    });
  });
}
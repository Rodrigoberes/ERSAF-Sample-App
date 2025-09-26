import 'package:ersaf_sampleapp/business/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Model', () {
    const uid = 'test-uid';
    const name = 'John';
    const surname = 'Doe';
    const email = 'john.doe@example.com';
    const password = 'password123';
    final createdAt = DateTime(2023, 1, 1);
    final updatedAt = DateTime(2023, 1, 2);

    test('fromJson creates User correctly', () {
      final json = {
        'uid': uid,
        'name': name,
        'surname': surname,
        'email': email,
        'password_hash': User.hashPassword(password),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

      final user = User.fromJson(json);

      expect(user.uid, uid);
      expect(user.name, name);
      expect(user.surname, surname);
      expect(user.email, email);
      expect(user.createdAt, createdAt);
      expect(user.updatedAt, updatedAt);
    });

    test('toJson returns correct map', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final json = user.toJson();

      expect(json['uid'], uid);
      expect(json['name'], name);
      expect(json['surname'], surname);
      expect(json['email'], email);
      expect(json['created_at'], createdAt.toIso8601String());
      expect(json['updated_at'], updatedAt.toIso8601String());
    });

    test('hashPassword generates consistent hash', () {
      final hash1 = User.hashPassword(password);
      final hash2 = User.hashPassword(password);

      expect(hash1, hash2);
      expect(hash1.length, 64); // SHA256 produces 64 character hex string
    });

    test('verifyPassword returns true for correct password', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(user.verifyPassword(password), true);
    });

    test('verifyPassword returns false for incorrect password', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(user.verifyPassword('wrongpassword'), false);
    });

    test('fullName returns correct full name', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(user.fullName, '$name $surname');
    });

    test('copyWith returns new User with updated fields', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final updatedUser = user.copyWith(name: 'Jane', email: 'jane.doe@example.com');

      expect(updatedUser.uid, uid);
      expect(updatedUser.name, 'Jane');
      expect(updatedUser.surname, surname);
      expect(updatedUser.email, 'jane.doe@example.com');
      expect(updatedUser.passwordHash, user.passwordHash);
      expect(updatedUser.createdAt, createdAt);
      expect(updatedUser.updatedAt, updatedAt);
    });

    test('== returns true for identical users', () {
      final user1 = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final user2 = User(
        uid: uid,
        name: 'Different',
        surname: 'Name',
        email: 'different@example.com',
        passwordHash: 'differenthash',
        createdAt: DateTime(2023, 1, 3),
        updatedAt: DateTime(2023, 1, 4),
      );

      expect(user1 == user2, true); // Only checks uid
    });

    test('== returns false for different uids', () {
      final user1 = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final user2 = User(
        uid: 'different-uid',
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(user1 == user2, false);
    });

    test('hashCode is based on uid', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(user.hashCode, uid.hashCode);
    });

    test('toString returns correct format', () {
      final user = User(
        uid: uid,
        name: name,
        surname: surname,
        email: email,
        passwordHash: User.hashPassword(password),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      final expected = 'User(uid: $uid, name: $name, surname: $surname, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
      expect(user.toString(), expected);
    });
  });
}
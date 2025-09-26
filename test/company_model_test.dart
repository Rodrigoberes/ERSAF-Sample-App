import 'package:ersaf_sampleapp/business/models/company.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Company Model', () {
    test('fromJson creates Company correctly', () {
      final json = {
        'id': 1,
        'name': 'FlixBus Italia',
        'cuit': '12345678901',
        'phone': '+39 02 1234-5678',
        'email': 'info@flixbus.it',
        'address': 'Via Roma 123, Milano',
        'icon': 'bus-icon-1.png',
        'is_active': true,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final company = Company.fromJson(json);

      expect(company.id, 1);
      expect(company.name, 'FlixBus Italia');
      expect(company.cuit, '12345678901');
      expect(company.phone, '+39 02 1234-5678');
      expect(company.email, 'info@flixbus.it');
      expect(company.address, 'Via Roma 123, Milano');
      expect(company.icon, 'bus-icon-1.png');
      expect(company.isActive, true);
      expect(company.createdAt, '2025-09-25T20:36:48.529677Z');
      expect(company.updatedAt, '2025-09-25T20:36:48.529677Z');
    });

    test('fromJson handles different company data', () {
      final json = {
        'id': 2,
        'name': 'Itabus',
        'cuit': '98765432109',
        'phone': '+39 06 9876-5432',
        'email': 'prenotazioni@itabus.it',
        'address': 'Piazza Venezia 456, Roma',
        'icon': 'bus-icon-2.png',
        'is_active': true,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final company = Company.fromJson(json);

      expect(company.id, 2);
      expect(company.name, 'Itabus');
      expect(company.cuit, '98765432109');
      expect(company.phone, '+39 06 9876-5432');
      expect(company.email, 'prenotazioni@itabus.it');
      expect(company.address, 'Piazza Venezia 456, Roma');
      expect(company.icon, 'bus-icon-2.png');
      expect(company.isActive, true);
    });

    test('fromJson handles inactive company', () {
      final json = {
        'id': 3,
        'name': 'Marino Autolinee',
        'cuit': '55566677701',
        'phone': '+39 081 555-1234',
        'email': 'info@marinobus.it',
        'address': 'Via Toledo 789, Napoli',
        'icon': 'bus-icon-3.png',
        'is_active': false,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final company = Company.fromJson(json);

      expect(company.id, 3);
      expect(company.name, 'Marino Autolinee');
      expect(company.isActive, false);
    });
  });
}
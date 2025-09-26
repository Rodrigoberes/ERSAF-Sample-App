import 'package:ersaf_sampleapp/business/models/route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Route Model', () {
    test('fromJson creates Route correctly', () {
      final json = {
        'id': 1,
        'company_id': 1,
        'origin_city': 'Roma',
        'origin_terminal': 'Stazione Tiburtina',
        'destination_city': 'Milano',
        'destination_terminal': 'Stazione Centrale',
        'distance_km': 570,
        'estimated_duration_minutes': 420,
        'base_price': 45,
        'is_active': true,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final route = Route.fromJson(json);

      expect(route.id, 1);
      expect(route.companyId, 1);
      expect(route.originCity, 'Roma');
      expect(route.originTerminal, 'Stazione Tiburtina');
      expect(route.destinationCity, 'Milano');
      expect(route.destinationTerminal, 'Stazione Centrale');
      expect(route.distanceKm, 570);
      expect(route.estimatedDurationMinutes, 420);
      expect(route.basePrice, 45);
      expect(route.isActive, true);
      expect(route.createdAt, '2025-09-25T20:36:48.529677Z');
      expect(route.updatedAt, '2025-09-25T20:36:48.529677Z');
    });

    test('fromJson handles route without base_price', () {
      final json = {
        'id': 2,
        'company_id': 2,
        'origin_city': 'Milano',
        'origin_terminal': 'Stazione Centrale',
        'destination_city': 'Torino',
        'destination_terminal': 'Stazione Porta Susa',
        'distance_km': 140,
        'estimated_duration_minutes': 120,
        'is_active': true,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final route = Route.fromJson(json);

      expect(route.id, 2);
      expect(route.companyId, 2);
      expect(route.originCity, 'Milano');
      expect(route.destinationCity, 'Torino');
      expect(route.distanceKm, 140);
      expect(route.estimatedDurationMinutes, 120);
      expect(route.basePrice, null);
      expect(route.isActive, true);
    });

    test('fromJson handles different route data', () {
      final json = {
        'id': 16,
        'company_id': 3,
        'origin_city': 'Bari',
        'origin_terminal': 'Stazione Centrale',
        'destination_city': 'Napoli',
        'destination_terminal': 'Stazione Centrale',
        'distance_km': 260,
        'estimated_duration_minutes': 240,
        'base_price': 22,
        'is_active': true,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final route = Route.fromJson(json);

      expect(route.id, 16);
      expect(route.companyId, 3);
      expect(route.originCity, 'Bari');
      expect(route.originTerminal, 'Stazione Centrale');
      expect(route.destinationCity, 'Napoli');
      expect(route.destinationTerminal, 'Stazione Centrale');
      expect(route.distanceKm, 260);
      expect(route.estimatedDurationMinutes, 240);
      expect(route.basePrice, 22);
      expect(route.isActive, true);
    });

    test('fromJson handles inactive route', () {
      final json = {
        'id': 3,
        'company_id': 1,
        'origin_city': 'Roma',
        'origin_terminal': 'Stazione Tiburtina',
        'destination_city': 'Napoli',
        'destination_terminal': 'Stazione Centrale',
        'distance_km': 220,
        'estimated_duration_minutes': 180,
        'base_price': 20,
        'is_active': false,
        'created_at': '2025-09-25T20:36:48.529677Z',
        'updated_at': '2025-09-25T20:36:48.529677Z',
      };

      final route = Route.fromJson(json);

      expect(route.id, 3);
      expect(route.companyId, 1);
      expect(route.isActive, false);
    });
  });
}
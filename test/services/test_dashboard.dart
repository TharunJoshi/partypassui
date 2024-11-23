import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/services/dashboard_service.dart';

void main() {
  final DashboardService dashboardService = DashboardService();

  group('DashboardService Tests', () {
    test('Dashboard should return valid data', () async {
      final token = 'sample_token';
      final response = await dashboardService.fetchDashboardData(token);
      expect(response['email'], equals('testuser@example.com'));
      expect(response['subscription_plan'], isNotNull);
    });
  });
}

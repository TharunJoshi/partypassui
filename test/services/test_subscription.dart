import 'package:flutter_test/flutter_test.dart';
import 'package:partypassui/services/subscription_service.dart';

void main() {
  final SubscriptionService subscriptionService = SubscriptionService();

  group('SubscriptionService Tests', () {
    test('Fetch subscription details should return valid data', () async {
      final token = 'sample_token';
      final response =
          await subscriptionService.fetchSubscriptionDetails(token);
      expect(response['plan_name'], equals('Premium'));
      expect(response['remaining_credits'], isNonNegative);
    });

    test('Renew subscription should return success message', () async {
      final token = 'sample_token';
      final response = await subscriptionService.renewSubscription(token);
      expect(response['message'], equals('Subscription renewed successfully'));
    });
  });
}

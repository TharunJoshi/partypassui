import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class SubscriptionService {
  final String subscriptionDetailsEndpoint = Constants.subscriptionEndpoint;

  // Fetch Subscription Details
  Future<Map<String, dynamic>> fetchSubscriptionDetails(String token) async {
    final url = Uri.parse(subscriptionDetailsEndpoint);
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch subscription details: ${response.body}');
    }
  }

  // Renew Subscription
  Future<Map<String, dynamic>> renewSubscription(String token) async {
    final url = Uri.parse('$subscriptionDetailsEndpoint/renew');
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to renew subscription: ${response.body}');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationService {
  final String baseUrl =
      'http://127.0.0.1:5000/notifications'; // Replace with your backend URL

  // Fetch Notifications
  Future<List<Map<String, dynamic>>> fetchNotifications(String token) async {
    final url = Uri.parse('$baseUrl');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch notifications: ${response.body}');
    }
  }
}

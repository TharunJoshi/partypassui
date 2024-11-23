import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardService {
  final String baseUrl =
      'http://127.0.0.1:5000/auth'; // Replace with your backend URL

  // Fetch Dashboard Data
  Future<Map<String, dynamic>> fetchDashboardData(String token) async {
    final url = Uri.parse('$baseUrl/dashboard');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch dashboard data: ${response.body}');
    }
  }
}

import 'package:flutter/material.dart';
import '../utils/session_manager.dart';
import 'login_signup_screen.dart';

class DashboardScreen extends StatelessWidget {
  void handleLogout(BuildContext context) async {
    await SessionManager.clearToken();

    // Redirect to Login Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginSignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => handleLogout(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/subscription_service.dart';
import '../providers/auth_provider.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionService subscriptionService = SubscriptionService();
  Map<String, dynamic>? subscriptionData;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchSubscriptionDetails();
  }

  void fetchSubscriptionDetails() async {
    final token =
        Provider.of<AuthProvider>(context, listen: false).user?['token'];
    if (token == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final data = await subscriptionService.fetchSubscriptionDetails(token);
      setState(() {
        subscriptionData = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch subscription: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void handleRenewSubscription() async {
    final token =
        Provider.of<AuthProvider>(context, listen: false).user?['token'];
    if (token == null) return;

    bool confirmed = await showConfirmationDialog(
      context,
      'Renew Subscription',
      'Are you sure you want to renew your subscription?',
    );
    if (!confirmed) return;

    try {
      final response = await subscriptionService.renewSubscription(token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'])),
      );
      fetchSubscriptionDetails(); // Refresh data after renewal
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to renew subscription: $e')),
      );
    }
  }

  Future<bool> showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
  ) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text('Confirm'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subscription')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : subscriptionData == null
              ? Center(child: Text('No subscription data available'))
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Plan: ${subscriptionData!['plan_name']}',
                          style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text(
                          'Credits Remaining: ${subscriptionData!['remaining_credits']}',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text('Expiry Date: ${subscriptionData!['expiry_date']}',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: handleRenewSubscription,
                        child: Text('Renew Subscription'),
                      ),
                    ],
                  ),
                ),
    );
  }
}

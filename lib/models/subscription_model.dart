class Subscription {
  final String planName;
  final double price;
  final int remainingCredits;
  final DateTime expiryDate;

  Subscription({
    required this.planName,
    required this.price,
    required this.remainingCredits,
    required this.expiryDate,
  });

  // Factory method to create a Subscription object from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      planName: json['plan_name'],
      price: json['price'],
      remainingCredits: json['remaining_credits'],
      expiryDate: DateTime.parse(json['expiry_date']),
    );
  }

  // Method to convert Subscription object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'plan_name': planName,
      'price': price,
      'remaining_credits': remainingCredits,
      'expiry_date': expiryDate.toIso8601String(),
    };
  }
}
